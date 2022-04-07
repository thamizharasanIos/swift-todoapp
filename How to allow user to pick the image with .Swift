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


//method 2
import UIKit

class CameraViewController: UIViewController,UINavigationControllerDelegate,UIImagePickerControllerDelegate {
    @IBOutlet var imageView: UIImageView!
      @IBOutlet var chooseBuuton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
   


    

    
    @IBAction func clickBtn(_ sender: Any) {
        let imagePicker = UIImagePickerController()
            imagePicker.sourceType = .photoLibrary
              imagePicker.delegate = self
              imagePicker.allowsEditing = true

              present(imagePicker, animated: true)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[UIImagePickerController.InfoKey(rawValue: "UIImagePickerControllerEditedImage")] as? UIImage{
            imageView.image = image
        }
        
        picker.dismiss(animated: true, completion: nil)
    }
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
}

