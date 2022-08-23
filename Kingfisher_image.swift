//
//  NextViewController.swift
//  UrbanPaintingApp
//
//  Created by thamizharasan t on 06/04/22.
// notifications
// https://www.youtube.com/watch?v=vMHitYa4obE

import UIKit
import Kingfisher

class NextViewController: UIViewController {

    var PaletData:[Palettelist]?
    var type:String?
    @IBOutlet weak var collectionViewe: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
      
        PalettelistApi(type: type)
      
        // Do any additional setup after loading the view.
    }
 
    func PalettelistApi(type: String?){
        let baseUrl = AppUrl.BaseURL
        let endPoint = EndPoint.getPalettesList.rawValue
        let urlStr = baseUrl + endPoint
        let usertoken = UserDefaults.standard.string(forKey: "usertoken")
        let dict = GetPalettesListModel(user_token:usertoken , type: type,only_for_fav: false)
                               if let url = URL(string: urlStr){
                                   var request = URLRequest(url: url)
                                   request.httpMethod = "POST"
                                   let data = try? JSONEncoder.init().encode(dict)
                                   request.httpBody = data
                                   URLSession.shared.dataTask(with: request) { [self] (data, response, error) in
                                                                   if let error = error{
                                                                       print(error)
                                                                       return
                                                                   }
                                                                           if let data = data{
                                                                               do{
                                                                                   let result = try JSONDecoder.init().decode(GetPalettesListResultModel.self, from: data)
                                                                                   if result.status_code == 200{
                                                                                       self.PaletData = result.data
                                                                                      
                                                                                       DispatchQueue.main.async {
                                                                                           collectionViewe.reloadData()
                                                                                       }
                                                                                     

                                                                                   }else {

                                                                                       
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
extension NextViewController: UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return PaletData?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "imgCollectionViewCell", for: indexPath) as! imgCollectionViewCell
        
        let data = PaletData?[indexPath.row]
            let urlStr = URL(string: data?.asset ?? "UnKnown")
                    cell.images.kf.setImage(with: urlStr)
        cell.colorView.backgroundColor = UIColor(hexString: data?.asset ?? "unknown")
        cell.images.layer.cornerRadius = 8
        cell.colorView.layer.cornerRadius = 8

            return cell
    
       
        
       
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize{
        let w = (view.frame.width - 80)/4
        let h = CGSize.init(width: w, height: w)
            return h

        }
}

//pod file
# Uncomment the next line to define a global platform for your project
# platform :ios, '9.0'

target 'UrbanPaintingApp' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!
  pod 'Kingfisher', '~> 7.0'
  # Pods for UrbanPaintingApp
  pod 'CarbonKit'

end

