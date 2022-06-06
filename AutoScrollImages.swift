import UIKit

class BannerTableViewCell: UITableViewCell {
    var bannerImg:[BannerImg] = [BannerImg(imaName: "9"),
                                 BannerImg(imaName: "4"),
                                 BannerImg(imaName: "5"),
                                 BannerImg(imaName: "6"),
                                 BannerImg(imaName: "free-Fire"),
                                 BannerImg(imaName: "8"),
    ]
    //Timer
    var timer:Timer?
    var currentcellIndex = 0
    @IBOutlet weak var pageController: UIPageControl!
    
    @IBOutlet weak var collectionView: UICollectionView!
    override func awakeFromNib() {
        super.awakeFromNib()
 //Timer
        timer = Timer.scheduledTimer(timeInterval: 2.0, target: self, selector: #selector(slideToNext), userInfo: nil, repeats: true)
        pageController.numberOfPages = bannerImg.count
        
    }
    //TimerFunctions
    @objc func slideToNext(){
        if currentcellIndex < bannerImg.count - 1{
            currentcellIndex = currentcellIndex + 1
            
        }else{
            currentcellIndex = 0
        }
        pageController.currentPage = currentcellIndex
        collectionView.scrollToItem(at: IndexPath(item: currentcellIndex, section: 0), at: .right, animated: true)
       
    }
}
