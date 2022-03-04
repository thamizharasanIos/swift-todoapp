//
//  OtpTableViewController.swift
//  Dabb
//
//  Created by thamizharasan t on 04/03/22.
//

import UIKit

class OtpTableViewController: UITableViewController, UITextFieldDelegate {
 
    
 
    @IBOutlet weak var TimerBtn: UIButton!
    var counter = 3
    override func viewDidLoad() {
        super.viewDidLoad()
      
        Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateCounter), userInfo: nil, repeats: true)

    }
    
    //OTP TIMER FUNCTION
    @objc func updateCounter() {
        //example functionality
        if counter > 0 {
            print("\(counter) seconds to the end of the world")
            TimerBtn.setTitle(String(counter), for:.normal)
            counter -= 1
        }
        
    }//TIMER END
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 0
    }
    override func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0
    }
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if  indexPath.row == 0 {
            return 200
        }else {
            return UITableView.automaticDimension
        }
    
    }
}

