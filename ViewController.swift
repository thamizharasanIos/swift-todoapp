//
//  ViewController.swift
//  NotesApp
//
//  Created by Trainee on 12/02/22.
//

import UIKit
var index = 0
var heart:[String] = []
var heartfill:[String] = []
var todos:[String] = []
var notes:[String] = []
class ViewController: UIViewController {
    var isClicked: Bool = false
//    name favorite icon
    @IBOutlet weak var favName: UIButton!
    @IBAction func favBtn(_ sender: UIButton) {
        if isClicked {
            isClicked = false
            favName.setTitle("Favorite", for: .normal)
            print("favorite")
//                let Storyboard = UIStoryboard(name: "Main", bundle: nil)
//                let vc = Storyboard.instantiateViewController(withIdentifier: "ViewController") as! ViewController
//
//                self.navigationController?.pushViewController(vc, animated: true)

        }
        
        else {
            isClicked = true
            favName.setTitle("UnFavorite", for: .normal)
            print("unfavorite")
            
//                let Storyboard = UIStoryboard(name: "Main", bundle: nil)
//                let vc = Storyboard.instantiateViewController(withIdentifier: "ViewController") as! ViewController
//
//                self.navigationController?.pushViewController(vc, animated: true)
            
            
            
            
        }
        
    }
    
    @IBOutlet weak var tableView: UITableView!
//    notification from input field
    override func viewDidLoad() {
        
        super.viewDidLoad()
        let name  = Notification.Name("todo-update")
        NotificationCenter.default.addObserver(self, selector: #selector(reload), name: name, object: nil)
       
    }
    @objc func reload(){
        print("loaded")
        tableView.reloadData()
    }
}

extension ViewController: UITableViewDelegate,UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return todos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellid", for: indexPath) as! NotesTableViewCell
        cell.taskName.text = todos[indexPath.row]
        cell.img.image = UIImage(named: notes[indexPath.row])
  
    
        return cell
    }


    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let modify = UIContextualAction(style: .normal, title: "Delete", handler: {(ac:UIContextualAction, view:UIView, success:(Bool) -> Void)in
            DispatchQueue.main.async {
                self.showDelete(for: indexPath)
            }
            
        })
        
        let edit = UIContextualAction(style: .normal, title: "Edit", handler: {(ac:UIContextualAction, view:UIView, success:(Bool) -> Void)in
            DispatchQueue.main.async {
            
                let Storyboard = UIStoryboard(name: "Main", bundle: nil)
                let vc = Storyboard.instantiateViewController(withIdentifier: "ToDoNextViewController") as! ToDoNextViewController
                
                vc.editdata =  todos[indexPath.row]
                vc.getFav =  notes[indexPath.row]
           
                todos.remove(at: indexPath.row)
                notes.remove(at: indexPath.row)
                
                self.tableView.reloadData()
               
                self.navigationController?.pushViewController(vc, animated: true)
                
             
            }
            
        })
        
        edit.backgroundColor = .blue
        modify.backgroundColor = .red
        return UISwipeActionsConfiguration(actions: [modify,edit])
    }
    func showDelete(for indexPath: IndexPath){
        let alert = UIAlertController(title: "Warning", message: "Warning Message", preferredStyle: .alert)
        let cancelAction = UIAlertAction(title: "cancel", style: .cancel, handler: nil)
        let deleteAction = UIAlertAction(title: "delete", style: .destructive) { _ in
            DispatchQueue.main.async {
                todos.remove(at: indexPath.row)
                self.tableView.deleteRows(at: [indexPath], with: .fade)
            }
        }
        alert.addAction(cancelAction)
        alert.addAction(deleteAction)
        
        present(alert,animated: true)
    }
    
    
}
