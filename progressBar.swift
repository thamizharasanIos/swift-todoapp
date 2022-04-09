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
