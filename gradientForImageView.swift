
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
