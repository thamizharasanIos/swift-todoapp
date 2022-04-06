
import UIKit
import CarbonKit

class CameraViewController: UIViewController,CarbonTabSwipeNavigationDelegate {
    var controllernames = ["plain","Texture","Wallpaper","Abstract"]
    var carbonTabSwipeNavigation = CarbonTabSwipeNavigation()
    override func viewDidLoad() {
        super.viewDidLoad()
        
       carbonTabSwipeNavigation = CarbonTabSwipeNavigation(items: controllernames, delegate: self)
        carbonTabSwipeNavigation.insert(intoRootViewController: self)
         
        carbonTabSwipeNavigation.setTabBarHeight(36)
        
        carbonTabSwipeNavigation.carbonSegmentedControl?.backgroundColor = UIColor.black
        
        carbonTabSwipeNavigation.setIndicatorColor(UIColor.white)
        carbonTabSwipeNavigation.setIndicatorHeight(2)
        
        carbonTabSwipeNavigation.setSelectedColor(UIColor.white)
        carbonTabSwipeNavigation.setNormalColor(UIColor.gray)
        
        
        carbonTabSwipeNavigation.carbonSegmentedControl?.setWidth(view.frame.width / 4, forSegmentAt: 0)
        carbonTabSwipeNavigation.carbonSegmentedControl?.setWidth(view.frame.width / 4, forSegmentAt: 1)
        carbonTabSwipeNavigation.carbonSegmentedControl?.setWidth(view.frame.width / 4, forSegmentAt: 2)
        carbonTabSwipeNavigation.carbonSegmentedControl?.setWidth(view.frame.width / 4, forSegmentAt: 3)
       
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
