//
//  MyListCell.swift
//  UrbanPaintingApp
//
//  Created by thamizharasan t on 08/04/22.
//

import UIKit

class MyListCell: UITableViewCell {

    @IBOutlet weak var offBtnOutL: UIButton!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

  
    @IBAction func offBtnAction(_ sender: Any) {
        if offBtnOutL.tag == 0 {
            let image = UIImage(named: "off")
            offBtnOutL.setImage(image, for: .normal)
            offBtnOutL.tag = 1
        }else {
            let image = UIImage(named: "on")
            offBtnOutL.setImage(image, for: .normal)
            offBtnOutL.tag = 0
        }
        
    }
}
