
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
// class
class GradientImageView:UIImageView{
    override func awakeFromNib() {
        super.awakeFromNib()
        backgroundColor = .clear
    }
    override func layoutSubviews() {
      super.layoutSubviews()
      createGradientLayer()
    }
    func createGradientLayer() {
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = self.bounds
        gradientLayer.startPoint = CGPoint(x: 0.6, y: 0)
        gradientLayer.endPoint = CGPoint(x:0.6, y:1)
        gradientLayer.colors = [UIColor.clear.cgColor, UIColor(named: "backgroundColor")?.cgColor]
        self.layer.insertSublayer(gradientLayer, at: 0)
    }
    
}
