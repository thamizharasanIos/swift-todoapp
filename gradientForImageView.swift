
import UIKit

class Image: UIViewController {
    @IBOutlet weak var imageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()

        let gradient = CAGradientLayer()
        gradient.frame = imageView.bounds
        gradient.contents = imageView.image?.cgImage
        gradient.colors = [UIColor.clear.cgColor, UIColor.black.cgColor]
        gradient.startPoint = CGPoint(x: 0.6, y: 0)
        gradient.endPoint = CGPoint(x: 0.6, y: 1)
        imageView.layer.addSublayer(gradient)
    }


}
// class for imageview
class GradientImageView:UIImageView{
    override func awakeFromNib() {
        super.awakeFromNib()
        backgroundColor = .clear
        
        
    }
    override func layoutSubviews() {
      super.layoutSubviews()
        layer.sublayers?.forEach { $0.removeFromSuperlayer() }
      createGradientLayer()
    }

    func createGradientLayer() {
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = self.bounds
        gradientLayer.startPoint = CGPoint(x: 0.5, y: 1.0)
        gradientLayer.endPoint = CGPoint(x: 0.5, y: 0.0)
        gradientLayer.colors = [UIColor(named: "backgroundColor")?.cgColor as Any,UIColor.clear.cgColor ]
        self.layer.addSublayer(gradientLayer)
       
    }
    
}
