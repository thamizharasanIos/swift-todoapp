
class ImagesList:UITableViewCell{
//    @IBOutlet weak var images: UIImageView!
//
//    @IBOutlet weak var email: UILabel!
//    @IBOutlet weak var name: UILabel!
//    @IBOutlet weak var img: UIImageView!
    var imgTop = false
    
    @IBOutlet weak var hiddenView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
//        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(imageTapped(tapGestureRecognizer:)))
//        img.isUserInteractionEnabled = true
//        img.addGestureRecognizer(tapGestureRecognizer)
//
        
    }
   
    
    @objc func imageTapped(tapGestureRecognizer: UITapGestureRecognizer)
    {
        let tappedImage = tapGestureRecognizer.view as! UIImageView
        if imgTop == false{
        hiddenView.isHidden = false
            imgTop = true
        animateDeleteBtn(xAxis: hiddenView.frame.width, isAnimate: false)
        animateDeleteBtn(xAxis: 0, isAnimate: true)
        }else{
            animateDeleteBtn(xAxis: hiddenView.frame.width, isAnimate: false)
            animateDeleteBtn(xAxis: 0, isAnimate: true)
            hiddenView.isHidden = true
            imgTop = false
        }
        // Your action
    }
}
//struct Pepules {
//    let names:String?
//    let email:String?
//    let image : String?
//    
//}
extension ImagesList{
    func animateDeleteBtn(xAxis: CGFloat, isAnimate: Bool = false, completion: (() -> Void)? = nil){
        if isAnimate == false{
            if xAxis == 0{
                self.hiddenView.transform = CGAffineTransform.identity
            }else{
                self.hiddenView.transform = CGAffineTransform.init(translationX: xAxis, y: 0)
            }
            if let completionHandler = completion{
                completionHandler()
            }
        }else{
            UIView.animate(withDuration: 0.5,
                delay: 0.0,
                usingSpringWithDamping: 1,
                initialSpringVelocity: 1,
                options: [ .curveLinear],
                animations: ({
                    if xAxis == 0{
                        self.hiddenView.transform = CGAffineTransform.identity
                    }else{
                        self.hiddenView.transform = CGAffineTransform.init(translationX: xAxis, y: 0)
                    }
                })){ _ in
                if let completionHandler = completion{
                    completionHandler()
                }
            }
        }
    }
}
