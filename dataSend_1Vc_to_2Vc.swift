

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
