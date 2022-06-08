//
//  HomeImgViewController.swift
//  UrbanPaintingApp
//
//  Created by thamizharasan t on 09/04/22.
//

import UIKit
import CoreMedia

class HomeImgViewController: UIViewController {
    var arr: [Img] = [
        Img(image: "1"),
    Img(image: "2"),
    Img(image: "3"),
    
    ]
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var progressBar: ProgressBar!
    var images = UIImage()
    var currentIndex = 0
    override func viewDidLoad() {
        super.viewDidLoad()
       
        // Do any additional setup after loading the view.
    }
    func updateProgress(){
        let t = Float(arr.count ?? 1)
        let i = Float (currentIndex + 1)
        let progress = i / t
        print(progress)
        progressBar.setProgress(progress, animated: true)
    }
}

extension HomeImgViewController:UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arr.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HomeImgCell", for: indexPath) as! HomeImgCell
        let data = arr[indexPath.row]
        cell.HomeImages.layer.cornerRadius = 12
        cell.HomeImages.image = UIImage(named: data.image)
      

        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 400, height: 270)
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
struct Img {
    var image: String
}
//ProgressBar
class ProgressBar: UIProgressView{
  override func layoutSubviews() {
    super.layoutSubviews()
    let maskLayerPath = UIBezierPath(roundedRect: bounds, cornerRadius: 4.0)
    let maskLayer = CAShapeLayer()
    maskLayer.frame = self.bounds
    maskLayer.path = maskLayerPath.cgPath
    layer.mask = maskLayer
     
  }
}
//

class LaunchScreen: UIViewController {
    var timer = Timer()
    @IBOutlet var progressBar:
    UIView!
    @IBOutlet var progressView:UIProgressView!
    var progress:Float = 0.0
    override var preferredStatusBarStyle: UIStatusBarStyle{
        return .lightContent
    }
    override func viewDidLoad() {
        super.viewDidLoad()
//        progressView.progress = 0.0
        self.progressView.progressTintColor = UIColor.clear
    
        progressbar()
    
    }
    
    

    func progressbar(){
        progressView.progress = progress
        timer = Timer.scheduledTimer(withTimeInterval: 0.05, repeats: true, block: {(timer)in
            self.progress += 0.03
            self.progressView.progress = self.progress
            if self.progressView.progress == 1.0{
                self.progressView.progress = 0.0
               
                
            }else{
               
            }
        })
    }

}



