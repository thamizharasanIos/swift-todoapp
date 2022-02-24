
//  ViewController.swift
//  NotesApp
//
//  Created by Trainee on 12/02/22.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var showAll: UIButton!
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var favName: UIButton!
    @IBOutlet weak var favAnduf: UIButton!
    
//    var notes:[String] = []
//    var notesArr = [[String:String]] ()
    var taskarr = [TaskModel]()
    var taskLabel = "All Task"
    var allTask = [TaskModel]()
    var editIndexpath: IndexPath?
//    {
//        didSet{
//
//        }
//    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        let dict = ["name" : "Madhan"]
//        let dict1 = ["name" : "Thamizh","isFav" : "true"]
//        notesArr.append(dict)
//        notesArr.append(dict1)
//        print(notesArr[0]["name"])
//        print(notesArr[1])
       
    }
    @IBAction func showAllTask(_ sender: Any) {
        taskLabel = "All Task"
        favAnduf.setImage(UIImage(named: "favourite_OFF"), for: .normal)
    showAll.setTitle(taskLabel, for: .normal)
        taskarr = allTask
        tableView.reloadData()
    }
    @IBAction func favBtn(_ sender: UIButton) {
//        let storyboard = UIStoryboard(name: "Main", bundle: nil)
//        let vc = storyboard.instantiateViewController(withIdentifier: "storyVc")
//        self.navigationController?.pushViewController(vc, animated: true)
//        performSegue(withIdentifier: "newVc", sender: nil)
        
      
            
        if taskLabel == "All Task"{
            allTask = taskarr
        taskLabel = "Task"
            let arr = taskarr.filter{($0.isFav == true)}
            taskarr = arr
            tableView.reloadData()
            favAnduf.setImage(UIImage(named: "favourite_ON"), for: .normal)
        showAll.setTitle(taskLabel, for: .normal)
        }
        
    }
    
    @IBAction func addBtn(_ sender: Any) {
        performSegue(withIdentifier: "nextvc", sender: nil)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let vc = segue.destination as? ToDoNextViewController {
            vc.delegate = self
            vc.editData = sender as? TaskModel
        }
    }
}

extension ViewController: UITableViewDelegate,UITableViewDataSource {
    
   
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return taskarr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellid", for: indexPath) as! NotesTableViewCell
        let t = taskarr[indexPath.row]
        
        cell.taskName.text = t.name
        let isFav = t.isFav
        if isFav == true {
            let image = UIImage(named: "favourite_ON")
            cell.img.setImage(image, for: .normal)
        }else {
            let image = UIImage(named: "favourite_OFF")
            cell.img.setImage(image, for: .normal)
        }
        
//        cell.img.image = UIImage(named: notes[indexPath.row])
               
        return cell
        
    }


    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        //delete button
        let modify = UIContextualAction(style: .normal, title: "Delete", handler: {(ac:UIContextualAction, view:UIView, success:(Bool) -> Void)in
                  DispatchQueue.main.async {
                      self.showDelete(for: indexPath)
                  }
                  
              })
              
        
        //edit data button
        
        let edit = UIContextualAction(style: .normal, title: "Edit", handler: {(ac:UIContextualAction, view:UIView, success:(Bool) -> Void)in
//            DispatchQueue.main.async {
//                self.performSegue(withIdentifier: "editNotes", sender: nil)
//                let storyboard = UIStoryboard(name: "Main", bundle: nil)
//                let vc = storyboard.instantiateViewController(withIdentifier: "ToDoNextViewController") as! ToDoNextViewController
            self.editIndexpath = indexPath
                let t = self.taskarr[indexPath.row]
//                vc.editData = t
//                self.navigationController?.pushViewController(vc, animated: true)
                self.performSegue(withIdentifier: "nextvc", sender: t)
//                }
        })
        
        
        edit.backgroundColor = .blue
        modify.backgroundColor = .red
        return UISwipeActionsConfiguration(actions: [edit,modify])
    }
    
    
    func showDelete(for indexPath: IndexPath){
        let alert = UIAlertController(title: "Warning", message: "Would you like to delete this item?", preferredStyle: .alert)
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        let deleteAction = UIAlertAction(title: "Ok", style: .destructive) { _ in
            DispatchQueue.main.async {
                self.taskarr.remove(at: indexPath.row)
                self.tableView.deleteRows(at: [indexPath], with: .fade)
            }
        }
        alert.addAction(cancelAction)
        alert.addAction(deleteAction)
        
        present(alert,animated: true)
    }
   
    
    
}

extension ViewController: taskProtocol {
    func updateTask(task: TaskModel) {
        if let indexPath = editIndexpath{
            taskarr[indexPath.row] = task
            tableView.reloadData()
        }
    }
    
    func addTask(task: TaskModel) {
        if task.isFav == true{
            self.taskarr.append(task)
            self.allTask.append(task)
            
        }else if  taskLabel == "All Task"{
            self.taskarr.append(task)
        }  else if task.isFav == false{
            self.allTask.append(task)
        }
        tableView.reloadData()
    }
    
    func addNotes(name: String) {
//        notes.append(name)
        tableView.reloadData()
    }
    
    
}
struct TaskModel {
    let name: String
    let isFav: Bool
//    init (name: String, isFav:Bool){
//        self.name = name
//        self.isFav = isFav
//    }
}
