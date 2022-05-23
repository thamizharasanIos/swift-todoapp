//
//  VideoPlayer.swift
//  GodMusicApp
//
//  Created by thamizharasan t on 23/05/22.
//

import UIKit

class VideoPlayer: UIViewController {
    var listData:[UserData]?
    override func viewDidLoad() {
        super.viewDidLoad()
        UseDta()
    }
    func UseDta(){
        if let path = Bundle.main.path(forResource: "list_data", ofType: "json") {
              do {
                let url = URL(fileURLWithPath: path)
                let data = try Data(contentsOf: url, options: .mappedIfSafe)
                let result = try JSONDecoder().decode([UserData].self, from: data)
                self.listData = result
               } catch let error {
                 print(error.localizedDescription)
               }
            }
    }

}
//
//
//  Module.swift
//  GodMusicApp
//
//  Created by thamizharasan t on 16/05/22.
//
struct UserData: Decodable{
    let description: String?
    let sources: [String]?
    let subtitle: String?
    let thumb: String?
    let title: String?
}
