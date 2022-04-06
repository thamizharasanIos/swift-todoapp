import UIKit
import CarbonKit

class CameraViewController: UIViewController,CarbonTabSwipeNavigationDelegate {
    var controllernames = ["Features","Products"]
    var carbonTabSwipeNavigation = CarbonTabSwipeNavigation()
    override func viewDidLoad() {
        super.viewDidLoad()
        
       carbonTabSwipeNavigation = CarbonTabSwipeNavigation(items: controllernames, delegate: self)
        carbonTabSwipeNavigation.insert(intoRootViewController: self)
       
    }
    func carbonTabSwipeNavigation(_ carbonTabSwipeNavigation: CarbonTabSwipeNavigation, viewControllerAt index: UInt) -> UIViewController {
          // return viewController at index
        guard  let  storyboard = storyboard else {return
            UIViewController()}
        if index == 0{
            
            return storyboard.instantiateViewController(withIdentifier: "NextViewController")
        }else{
            
            return storyboard.instantiateViewController(withIdentifier: "NextViewController")
        }
      }
}
