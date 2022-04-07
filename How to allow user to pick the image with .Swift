//
//  CameraViewController.swift
//  login
//
//  Created by thamizharasan t on 07/04/22.
//

import UIKit

class CameraViewController: UIViewController,UINavigationControllerDelegate,UIImagePickerControllerDelegate {
    @IBOutlet var imageView: UIImageView!
      @IBOutlet var chooseBuuton: UIButton!
      var imagePicker = UIImagePickerController()
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    @IBAction func btnClicked() {

          if UIImagePickerController.isSourceTypeAvailable(.savedPhotosAlbum){
              print("Button capture")

              imagePicker.delegate = self
              imagePicker.sourceType = .savedPhotosAlbum
              imagePicker.allowsEditing = false

              present(imagePicker, animated: true, completion: nil)
          }
      }
    func imagePickerController(picker: UIImagePickerController!, didFinishPickingImage image: UIImage!, editingInfo: NSDictionary!){
           self.dismiss(animated: true, completion: { () -> Void in

           })

           imageView.image = image
       }


}
