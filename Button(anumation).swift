import UIKit

class Button: UIViewController {

    @IBOutlet weak var btn: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func btn(_ sender: UIButton) {
        sender.transform = CGAffineTransform(scaleX: 0.6, y: 0.6)

           UIView.animate(withDuration: 2.0,
                                      delay: 0,
                                      usingSpringWithDamping: CGFloat(0.20),
                                      initialSpringVelocity: CGFloat(6.0),
                                      options: UIView.AnimationOptions.allowUserInteraction,
                                      animations: {
                                       sender.transform = CGAffineTransform.identity
               },
                                      completion: { Void in()  }
           )
    }
    
}
