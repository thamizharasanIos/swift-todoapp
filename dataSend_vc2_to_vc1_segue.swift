//
//  SenderViewController.swift
//  login
//
//  Created by thamizharasan t on 28/03/22.
//

import UIKit

protocol selectDelgate{
    func select(s: String)
    func text(t:String)
   
}

class SenderViewController: UIViewController {
    var text1: String = ""
    @IBOutlet weak var text2: UITextField!
    var selectionDelegate: selectDelgate!
    override func viewDidLoad() {
        super.viewDidLoad()
        let text1 = text2.text
        // Do any additional setup after loading the view.
    }
    
    @IBAction func btn1(_ sender: Any) {
        selectionDelegate.select(s: text1)
        dismiss(animated: true, completion: nil)
        selectionDelegate.text(t: text2.text ?? "unknow")
    }
    
    @IBAction func btn2(_ sender: Any) {
        selectionDelegate.select(s: "two")
      
        dismiss(animated: true, completion: nil)
    }
    
    
}

//
//  ReceiveViewController.swift
//  login
//
//  Created by thamizharasan t on 28/03/22.
//

import UIKit

class ReceiveViewController: UIViewController {
  

    @IBOutlet weak var labelss: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func next(_ sender: Any) {
        let SenderVc = storyboard?.instantiateViewController(withIdentifier: "nexttt") as! SenderViewController
        SenderVc.selectionDelegate = self
        present(SenderVc, animated: true, completion: nil)
    }
    
}
 
extension ReceiveViewController: selectDelgate{
    func text(t: String) {
        labelss.text = t
    }
    
    func select(s: String) {
//        labelss.text = s
    }
    
    
}
