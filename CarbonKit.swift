
import UIKit
import CarbonKit
//pod 'CarbonKit'

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
        //        carbonTabSwipeNavigation.setSelectedColor(UIColor.white,font: UIFont(name:"OpenSauceOne-SemiBold" , size: 14)!)
//        carbonTabSwipeNavigation.setNormalColor(UIColor.gray,font: UIFont(name:"OpenSauceSans-Regular" , size: 14)!)
        
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
// CarbonKit backgroundColerChenge 

//
//  ProfileVc.swift
//  SDC Global Cinema Release
//
//  Created by thamizharasan t on 13/06/22.
//

import UIKit
import CarbonKit
import SwiftUI

class ProfileVc: UIViewController,CarbonTabSwipeNavigationDelegate  {
    override var preferredStatusBarStyle: UIStatusBarStyle{
        return .lightContent
    }
    @IBOutlet weak var Views: UIView!
    var controllernames = ["Payment History","Gifted History","PREFERRED LANGUAGE"]
    var carbonTabSwipeNavigation = CarbonTabSwipeNavigation()
    override func viewDidLoad() {
        super.viewDidLoad()
        
//       carbonTabSwipeNavigation = CarbonTabSwipeNavigation(items: controllernames, delegate: self)
//        carbonTabSwipeNavigation.insert(intoRootViewController: self,andTargetView: Views)
//
//
//        carbonTabSwipeNavigation.carbonSegmentedControl?.backgroundColor = .init(named: "backgroundColor")
//
//        carbonTabSwipeNavigation.setIndicatorColor(.init(named: "backgroundColor"))
//        carbonTabSwipeNavigation.setIndicatorHeight(1)
//
//
//
//        carbonTabSwipeNavigation.setSelectedColor(UIColor(named: "pagecontrol")!)
//        carbonTabSwipeNavigation.setNormalColor(UIColor.white)
        setViewPager()
//        carbonTabSwipeNavigation.setSelectedColor(UIColor(named: "pagecontrol")!,font: UIFont(name:"FontsFree-Net-SFProDisplay-Semibold.ttf" , size: 14)!)
//        carbonTabSwipeNavigation.setNormalColor(UIColor.white,font: UIFont(name:"OpenSauceSans-Regular" , size: 14)!)
        
        

 
       
    }
    func setViewPager(){
        carbonTabSwipeNavigation = CarbonTabSwipeNavigation(items: controllernames, delegate: self)
         carbonTabSwipeNavigation.insert(intoRootViewController: self,andTargetView: Views)
        carbonTabSwipeNavigation.toolbar.isTranslucent = true

         carbonTabSwipeNavigation.carbonSegmentedControl?.backgroundColor = .init(named: "backgroundColor")
        carbonTabSwipeNavigation.setTabExtraWidth(36)
         carbonTabSwipeNavigation.setIndicatorHeight(0)
        carbonTabSwipeNavigation.setTabBarHeight(28)
         carbonTabSwipeNavigation.setSelectedColor(UIColor(named: "pagecontrol")!)
         carbonTabSwipeNavigation.setNormalColor(UIColor.white)
    }
    func carbonTabSwipeNavigation(_ carbonTabSwipeNavigation: CarbonTabSwipeNavigation, viewControllerAt index: UInt) -> UIViewController {
          // return viewController at index
        guard  let  storyboard = storyboard else {return
            UIViewController()}
        if index == 0{
            
            return storyboard.instantiateViewController(withIdentifier: "PaymentHistoryVc")
        }else if index == 1{
            
            return storyboard.instantiateViewController(withIdentifier: "GiftedHistoryVc")
        }else{
            return storyboard.instantiateViewController(withIdentifier: "PreferredLanguageVc")
        }
      }
    
    
    @IBAction func SettingsButton(_ sender: Any) {
        performSegue(withIdentifier: "SettingsVc", sender: nil)
    }

}
//CarbonTabSwipeSegmentedControl

- (void)drawRect:(CGRect)rect {
    [super drawRect:rect];

    // Add extra width to each segment and calculate the segment width
    CGFloat totalWidth = 0;
    for (UIView *segment in self.segments) {
        NSInteger index = [self.segments indexOfObject:segment];
        CGFloat width = [self getWidthForSegmentAtIndex:index];
        CGRect segmentRect = segment.frame;
        segmentRect.origin.x = totalWidth;
        segmentRect.size.width = width + _tabExtraWidth;
        segment.frame = segmentRect;
        totalWidth += segmentRect.size.width;
        
//        NSLog(@"%@", CGRectMake(0, 0, segment.frame.size.width-24, segment.frame.size.height));
        UIView * v = [[UIView alloc]initWithFrame: CGRectMake(12, 0, segment.frame.size.width-24, segment.frame.size.height)];
        v.tag = 1000;
        v.layer.cornerRadius = segment.frame.size.height/2;
        [segment insertSubview:v atIndex:0];
    }

    _tabExtraWidth = 0;

//syncImageTintColor

- (void)syncImageTintColor {
    for (UIView *segment in self.segments) {
        if ([self.segments indexOfObject:segment] == self.selectedSegmentIndex) {
            UIView * v = segment.subviews.firstObject;
            if(v.tag == 1000){
                v.backgroundColor = [_imageSelectedColor colorWithAlphaComponent:0.12];
            }
        }else{
            UIView * v = segment.subviews.firstObject;
            if(v.tag == 1000){
                v.backgroundColor = [UIColor.whiteColor colorWithAlphaComponent:0.15];
            }
        }
        for (UIView *subView in segment.subviews) {
            if ([subView isKindOfClass:[UIImageView class]]) {
                if ([self.segments indexOfObject:segment] == self.selectedSegmentIndex) {
                    subView.tintColor = _imageSelectedColor;
                } else {
                    subView.tintColor = _imageNormalColor;
                }
            }
        }
    }
}
































//Kingfisher

import UIKit
import Kingfisher

class HomeImgViewController: UIViewController {
    var RoomList:[Images]?
    var collectionOfImages = [String]()
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var titleLabel: UILabel!
    var Hometitle: String?
    var listToken: String?
    var clientToken: String?
    @IBOutlet weak var progressBar: UIProgressView!
    
    var currentIndex = 0
    override func viewDidLoad() {
        super.viewDidLoad()
 
//        titleLabel.text = Hometitle
//        print(listToken)
//        print (clientToken)
        updateProgress()
        getIndividualRoomList()
    }
    func updateProgress(){
        let t = Float(RoomList?.count ?? 0)
              let i = Float (currentIndex + 1)
              let progress = i / t
              print(progress)
//              progressBar.setProgress(progress, animated: true)
//        collectionView.indexPathsForVisibleItems.forEach { [weak self] indexPath in
//            guard let sself = self else { return }
//            print(indexPath.row)
//            if let cell = sself.collectionView.cellForItem(at: indexPath){
//                let point = cell.frame.origin
//                let item = cell.frame
//                print(item)
//                let j = item.minX-16.0 - point.x
//                if j <= 237 && j >= 0{
//                  let progress = Float((indexPath.row+1))/Float(arr.count)
//                    progressBar.setProgress(progress, animated: true)
//                }
//            }
//        }
    }
    @IBAction func BackBtn(_ sender: Any) {
       
    }
    @IBAction func ShareBtnAction(_ sender: Any) {
        presentShareSheet()
    }
    func presentShareSheet(){
       guard let image = UIImage(systemName: "bell"), let url = URL(string: "https://www.google.com") else{
           return
       }
           let shareSheetVc = UIActivityViewController(activityItems: [
             image,
             url
           ], applicationActivities: nil
       )
       present(shareSheetVc, animated: true)
   }
    func getIndividualRoomList(){
        let baseUrl = AppUrl.BaseURL
        let endPoint = EndPoint.getIndividualRoomList.rawValue
        let urlStr = baseUrl + endPoint
        let usertoken = UserDefaults.standard.string(forKey: "usertoken")
        let dict = ["user_token": clientToken,"list_token": listToken]
                               if let url = URL(string: urlStr){
                                   var request = URLRequest(url: url)
                                   request.httpMethod = "POST"
                                   let data = try? JSONEncoder.init().encode(dict)
                                   request.httpBody = data
                                   URLSession.shared.dataTask(with: request) {(data, response, error) in
                                                                   if let error = error{
                                                                       print(error)
                                                                       return
                                                                   }
                                                                           if let data = data{
                                                                               do{
                                                                                   let result = try JSONDecoder.init().decode(GetIndividualRoomList.self, from: data)
                                                                                   if result.status_code == 200{
                                                                                       print(result.message)
                                                                                       self.RoomList = result.data?.images
//                                                                                       DispatchQueue.main.async {
//                                                                                           self.collectionView.reloadData()
//                                                                                       }
                                                                                       
                                                                                    
                                                                                   }else {
                                                                                       print(result.message)
                                                                                       
                                                                                   }
                                                                               }catch let error{
                                                                                   print(error)
                                                                               }

                                                                           }
                                                               }.resume()
                                                       }else {
                                                               print("invalid URL")
                                                       }
    }
    
}



extension HomeImgViewController:UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    func numberOfSections(in collectionView: UICollectionView) -> Int {
          return 2
      }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if section == 0{
            return RoomList?.count ?? 0
        }else if section == 1{
            return 1
        }else{
            return 0
        }
       
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.section == 0{
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HomeImgCell", for: indexPath) as! HomeImgCell
     
        let data = RoomList?[indexPath.row]
        let urlStr = URL(string: data?.url ?? "unKnown")
            cell.HomeImages.kf.setImage(with: urlStr)
            cell.HomeImages.layer.cornerRadius = 12
            return cell
        }else if indexPath.section == 1{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PaletteCell", for: indexPath) as! PaletteCell
//            let data = RoomList?[indexPath.row]
//            let urlStr = URL(string: data?.url ?? "unKnown")
//                cell.paletteImg.kf.setImage(with: urlStr)
//                cell.HomeImages.layer.cornerRadius = 12
            return cell
        }else{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PaletteCell", for: indexPath)
            return cell
        }
      
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if indexPath.section == 0{
        return CGSize(width: 237, height: 270)
        }else{
            return CGSize(width: 70, height: 70)
        }
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let offSet = scrollView.contentOffset.x
             let width = scrollView.frame.width
             let horizontalCenter = width / 2
             let index = Int(offSet + horizontalCenter) / Int(width)
            currentIndex = index
         updateProgress()
         print(currentIndex)

        }
    
}










