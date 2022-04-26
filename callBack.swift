//FirstViewController
 
import UIKit
 
class FirstViewController: UIViewController {
 
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    override func viewWillAppear(_ animated: Bool) {
         
    }
 
    @IBAction func pushToSecond(_ sender: Any) {
        if let vc = storyboard?.instantiateViewController(withIdentifier: "SecondViewController")as? SecondViewController {
             vc.callBack = { (id: String,name: String,age: Int) in
                print(id,name,age)
            }
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
    
}
//SecondViewController
import UIKit
 
class SecondViewController: UIViewController {
 
    var callBack: ((_ id: String, _ name: String, _ age: Int)-> Void)?
    
    @IBAction func BackToFirstWitData(_ sender: Any) {
        
        callBack?("1","Test",22)
        self.navigationController?.popViewController(animated: true)
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
}
