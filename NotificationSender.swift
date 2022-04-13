//
//  NotificationSender1vc.swift
//  login
//
//  Created by thamizharasan t on 13/04/22.
//

import UIKit

class NotificationSender1vc: UIViewController {

    @IBOutlet weak var labelOut: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func viewWillAppear(_ animated: Bool) {
        NotificationCenter.default.addObserver(self, selector: #selector(didGetNotification(_:)), name: Notification.Name("text"), object: nil)
    }
    @objc func didGetNotification(_ notification: Notification){
        let txt = notification.object as! String?
        labelOut.text = txt
    }
    @IBAction func goBtn(_ sender: Any) {
        performSegue(withIdentifier: "tt", sender: nil)
//        let vc = storyboard?.instantiateViewController(withIdentifier: "NotificationSender2vc") as! NotificationSender2vc
//        vc.modalPresentationStyle = .fullScreen
//        present(vc , animated: true)
    }
    


}
//
//  NotificationSender2vc.swift
//  login
//
//  Created by thamizharasan t on 13/04/22.
//

import UIKit

class NotificationSender2vc: UIViewController {

    @IBOutlet weak var TextFieldOut: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

       
    }
    


    @IBAction func SaveBtn(_ sender: Any) {
        NotificationCenter.default.post(name: Notification.Name("text"), object: TextFieldOut.text)
        dismiss(animated: true, completion: nil)
    }
    
}
