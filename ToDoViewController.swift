//
//  ToDoViewController.swift
//  NotesApp
//
//  Created by Trainee on 12/02/22.
//<badge src="resource://button-rated" />
//<badge src="resource://button-rated" />

import UIKit

class ToDoViewController: UIViewController {
    
    var isActive: Bool = false
    @IBOutlet weak var ToDoText: UITextField!
//    imgBtn.setTitle("UnFavourite", for: .normal)
    @IBOutlet weak var imgBtn: UIButton!
    @IBAction func buttonStart(_ sender: UIButton) {
        if isActive {
            isActive = false
            imgBtn.setTitle("UnFavourite", for: .normal)
        }
        else{
            isActive = true
            imgBtn.setTitle("Favourite", for: .normal)
            
        }
    }
    
    
      
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
 
    @IBAction func SaveBtn(_ sender: Any) {
        if let todo = ToDoText.text, !todo.isEmpty{
            todos.append(todo)
        let name  = Notification.Name(rawValue: "todo-update")
        NotificationCenter.default.post(name: name, object: nil)
//        self.dismiss(animated: true)
            ToDoText.text = nil
        }
    }
}
