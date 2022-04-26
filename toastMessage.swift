//MARK:TOAST
class ToastLabel: UITextField{
    
    var title: String = ""
    
    private var padding = UIEdgeInsets(top: 14, left: 16, bottom: 14, right: 16)
    override open func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }

    override open func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }

    override open func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }

    private lazy var titleLbl: UILabel = {
        let lbl = UILabel()
        lbl.numberOfLines = 0
        lbl.text = title
        lbl.font = UIFont(name: Font.regularFont, size: 12)
        lbl.textColor = UIColor.FCWhiteToBlack
        let origin = CGPoint(x: padding.left, y: padding.right)
        let size = CGSize(width: self.frame.width-(padding.left+padding.right), height: 12)
        lbl.frame = CGRect.init(origin: origin, size: size)
        lbl.sizeToFit()
        return lbl
    }()
    override func layoutSubviews() {
        super.layoutSubviews()
        self.layer.cornerRadius = 12
        self.layer.shadowRadius = 12
        self.layer.shadowColor = UIColor(red: 0.059, green: 0.059, blue: 0.059, alpha: 0.08).cgColor
        self.layer.shadowOpacity = 1
        self.clipsToBounds = false
    }
    func setTitle(title: String) {
        self.title = title
        self.addSubview(titleLbl)
        self.frame.size.height = titleLbl.frame.size.height+32
        self.backgroundColor = UIColor(rgb: 0x262626)
    }
}
extension UIViewController{
    var tabbarHeight: CGFloat{
        if let h = tabBarController?.tabBar.frame.height{
            return h-30
        }
        return 0
    }
    func showToast(toastMessage:String?,inset bottom: CGFloat = 0) {
        if let toastMessage = toastMessage{
            DispatchQueue.main.async { [self] in
                let rect = CGRect(x: 8, y: 8, width: self.view.frame.width-16, height: 48)
                let lblMessage = ToastLabel(frame: rect)
                lblMessage.setTitle(title: toastMessage)
            
            var lblMinY = lblMessage.frame.height+12
            if tabBarController == nil || tabBarController?.tabBar.isHidden == true{
                lblMinY += SafeArea.bottom
            }else{
                lblMinY += tabbarHeight
            }
            lblMessage.frame.origin.y = view.frame.height-lblMinY-bottom
            lblMessage.transform = CGAffineTransform.init(translationX: 0, y: view.frame.height)
            
            UIView.animate(withDuration: 0.5) {
                lblMessage.transform = CGAffineTransform.identity
            } completion: { _ in
                self.view.window?.addSubview(lblMessage)
                UIView.animate(withDuration:0.5, delay: 2, options: [] , animations: {
                    lblMessage.transform = CGAffineTransform.init(translationX: 0, y: self.view.frame.height)
                    self.view.addSubview(lblMessage)
                }, completion: { _ in
                    lblMessage.removeFromSuperview()
                })
            }
            self.view.addSubview(lblMessage)
            }
        }
    }
    
}
// SafeArea
struct SafeArea{
    static var bottom: CGFloat{
        get {
            let edge: UIEdgeInsets?
            if #available(iOS 13.0, *) {
                let window = UIApplication.shared.windows.filter {$0.isKeyWindow}.first
                edge = window?.safeAreaInsets
            } else {
                edge = UIApplication.shared.delegate?.window??.safeAreaInsets
            }
            return edge?.bottom ?? 0
        }
    }
    static var top: CGFloat{
        get {
            let edge: UIEdgeInsets?
            if #available(iOS 13.0, *) {
                let window = UIApplication.shared.windows.filter {$0.isKeyWindow}.first
                edge = window?.safeAreaInsets
            } else {
                edge = UIApplication.shared.delegate?.window??.safeAreaInsets
            }
            return edge?.top ?? 0
        }
    }
}


struct Font {
    static let regularFont = "OpenSauceSans-Regular"
    static let semiboldFont = "OpenSauceOne-SemiBold"
    static let mediumFont = "OpenSauceSans-Medium"
    static let boldFont = "OpenSauceOne-Bold"
}


extension UIColor{
    static let BGWhiteToBlack = UIColor(named: "BGWhiteToBlack")!
    static let BGBlackToWhite = UIColor(named: "BGBlackToWhite")!
    static let BGBorderGrey = UIColor(named: "BGBorderGrey")!
    static let BGWhite = UIColor.white
    static let BGGrey = UIColor(named: "BGGrey")!
    static let BGRed = UIColor(named: "BGRed")!
    
    
    static let FCWhiteToBlack = UIColor(named: "FCWhiteToBlack")!
    static let FCBlackToWhite = UIColor(named: "FCBlackToWhite")!
    static let FCPurple = UIColor(named: "FCPurple")!
    
    static let BottomSheetBGColor = UIColor(hexString: "#0F0F0F")?.withAlphaComponent(0.6)
}
//toast end

extension UIColor {
  convenience init(red: Int, green: Int, blue: Int) {
    assert(red >= 0 && red <= 255, "Invalid red component")
    assert(green >= 0 && green <= 255, "Invalid green component")
    assert(blue >= 0 && blue <= 255, "Invalid blue component")
    self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: 1.0)
  }
    convenience init(rgb: Int) {
            self.init(
                red: (rgb >> 16) & 0xFF,
                green: (rgb >> 8) & 0xFF,
                blue: rgb & 0xFF
            )
        }

    
  convenience init?(hexString: String, alpha: CGFloat = 1.0) {
    var hexSanitized = hexString.trimmingCharacters(in: .whitespacesAndNewlines)
    hexSanitized = hexSanitized.replacingOccurrences(of: "#", with: "")
     
    guard let int = Scanner(string: hexSanitized).scanInt32(representation: .hexadecimal) else { return nil }
    let a, r, g, b: Int32
    switch hexSanitized.count {
    case 3:
      (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17) // RGB (12-bit)
    case 6:
      (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)          // RGB (24-bit)
    case 8:
      (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)    // ARGB (32-bit)
    default:
      (a, r, g, b) = (255, 0, 0, 0)
    }
    self.init(red: CGFloat(r) / 255.0, green: CGFloat(g) / 255.0, blue: CGFloat(b) / 255.0, alpha: CGFloat(a) / 255.0)
  }
}
