
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










