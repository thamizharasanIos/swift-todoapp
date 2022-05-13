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

//uiView tap the button view move left to right
import UIKit

class Animation: UIViewController {
var top = false
    @IBOutlet weak var topview: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    func moveRight(view: UIView){
        if top == false{
            UIView.animate(withDuration: 1, animations: { [self] in
                view.center.x += 300
                topview.isHidden = false
            })
            top = true
        }else{
            UIView.animate(withDuration: 1, animations: { [self] in
                view.center.x += 300
                topview.isHidden = true
            })
            top = false
        }
       
       
    }
  
    @IBAction func btn(_ sender: Any) {
        moveRight(view: self.topview)

  }
}
