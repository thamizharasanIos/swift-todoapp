//
//  ExpandableTableViewCells.swift
//  FrameWorks
//
//  Created by thamizharasan t on 15/12/22.
//

import UIKit

class ExpandableTableViewCells: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    private var Arr = [Section]()
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        Arr = [Section(title: "tamil", options: ["12","22","33","55"], isOpened: false),
               Section(title: "kalai", options: ["88","997","99"], isOpened: false),
               Section(title: "kumar", options: ["1","3"], isOpened: false),
               Section(title: "selvan", options: ["5"], isOpened: false),
               Section(title: "karan", options: ["44","98","77"], isOpened: false)
        ]
    }

}
extension ExpandableTableViewCells: UITableViewDelegate,UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int {
     return   Arr.count
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let data = Arr[section]
        if data.isOpened == true{
            
            return data.options.count + 1
           
        }else{
            return 1
        }
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        
    let cell = tableView.dequeueReusableCell(withIdentifier: "ExpantableTVCell", for: indexPath) as! ExpantableTVCell
        
        if indexPath.row == 0{
          
            cell.label.text = Arr[indexPath.section].title
           
        }else{
            cell.label.text = Arr[indexPath.section].options[indexPath.row - 1]
            
        }

        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
  
          
        if indexPath.row == 0{
            
            if  Arr[indexPath.section].isOpened ==  true{
                Arr[indexPath.section].isOpened = false
            }else{
                Arr[indexPath.section].isOpened = true
                
            }
        }else{
            print(Arr[indexPath.section].options[indexPath.row - 1])
          
        }
        tableView.reloadSections([indexPath.section], with: .none)
       
       
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
}

class Section{
    let title: String
    let options: [String]
    var isOpened: Bool
    init(title: String,options: [String],isOpened: Bool){
        self.title = title
        self.options = options
        self.isOpened = isOpened
    }
}


// ----------------------------------------cell---------------------------
//
//  ExpantableTVCell.swift
//  FrameWorks
//
//  Created by thamizharasan t on 15/12/22.
//

import UIKit

class ExpantableTVCell: UITableViewCell {

    @IBOutlet weak var label: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    
    }

}
