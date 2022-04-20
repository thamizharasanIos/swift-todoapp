

import UIKit

class firstViewController: UIViewController {

    @IBOutlet weak var text: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

       
    }
  

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let sv = segue.identifier as! Next2ViewController
        sv.receivedString = text.text!
    }

    @IBAction func goBtn(_ sender: Any) {
        performSegue(withIdentifier: "next", sender: nil)
    }
    

}
//////////or///////////////
  
    @IBAction func deleteBtnAction(_ sender: UIButton) {
   performSegue(withIdentifier: "Deletepopup", sender: self)
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "Deletepopup"{
            let VC = segue.destination as! Deletepopup
            VC.listToken = listToken
        }
    }
///////////////////////////////////

//
//  Next2ViewController.swift
//  login
//
//  Created by thamizharasan t on 28/03/22.
//

import UIKit

class Next2ViewController: UIViewController {

    @IBOutlet weak var lables: UILabel!
    var receivedString = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        lables.text = receivedString
        // Do any additional setup after loading the view.  
    }
    


}
