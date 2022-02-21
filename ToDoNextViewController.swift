//
//  ToDoNextViewController.swift
//  NotesApp
//
//  Created by Trainee on 14/02/22.
//

import UIKit


class ToDoNextViewController: UIViewController {

    var isActive: Bool = false
    var arr: String = ""
    var editdata = ""
    var getFav = ""
    var editFav:Bool = false

        @IBOutlet weak var ToDoText: UITextField!
        @IBOutlet weak var imgBtn: UIButton!
        @IBAction func buttonStart(_ sender: UIButton) {
            if isActive {
                isActive = false
                imgBtn.setTitle("UnFavorite", for: .normal)
            }
            else {
                isActive = true
                imgBtn.setTitle("Favorite", for: .normal)
            }
        }
    
    
    
        override func viewDidLoad() {
            super.viewDidLoad()
            ToDoText.text = editdata
            // Do any additional setup after loading the view.
            if getFav == "heart.fill" {
                editFav = false
                imgBtn.setTitle("Favorite", for: .normal)
            }else if getFav == "heart1" {
                editFav = true
                imgBtn.setTitle("UnFavorite", for: .normal)
            }
        }
    
    
        @IBAction func SaveBtn(_ sender: Any) {
            if let todo = ToDoText.text, todo.count > 3 , !todo.isEmpty {
        
                todos.append(todo)
                
                if isActive {
                    isActive = false
                    
//                     notes.append("heart.fill")
                    notes.append("heart.fill")
                    heartfill.append("heart.fill")
                    
                }
                    else{
                        isActive = true
//                    notes.append("heart1")
                        notes.append("heart1")
                        heart.append("heart1")
                }
//
            let name  = Notification.Name(rawValue: "todo-update")
            NotificationCenter.default.post(name: name, object: nil)
    //        self.dismiss(animated: true)
                ToDoText.text = nil
               
            }
        }
}
