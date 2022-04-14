//
//  Share.swift
//  login
//
//  Created by thamizharasan t on 14/04/22.
//

import UIKit

class Share: UIViewController {

//    private let button: UIButton = {
//        let button = UIButton()
//        button.backgroundColor = .link
//        button.setTitle("Tap Me", for: .normal)
//        return button
//    }()
    override func viewDidLoad() {
        super.viewDidLoad()
//        button.frame = CGRect(x: 0, y: 0, width: 200, height: 50)
//        button.center = view.center
//        button.addTarget(self, action: #selector(presentShareSheet), for: .touchUpInside)
//        view.addSubview(button)
    }
    @IBAction func btn(_ sender: Any) {
        presentShareSheet()
    }
    
     func presentShareSheet(){
        guard let image = UIImage(systemName: "bell"), let url = URL(string: "https://www.google.com") else{
            return
        }
            let shareSheetVc = UIActivityViewController(activityItems: [
              image,
              url
            ], applicationActivities: nil
        )
        present(shareSheetVc, animated: true)
    }


}
