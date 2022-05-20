//
//  SingletonClass.swift
//  login
//
//  Created by thamizharasan t on 20/05/22.
//
//view controller
import UIKit

class SingletonClass: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        observer()
        singleton_class.share.text()
    }
    
    func observer(){
        singleton_class.share.names = { [weak self] (name, floats, ints) in
            guard self == self else {return}
            print(name)
            print(floats)
            print(ints)
        }
    }


}
/////


//singleton_class
import Foundation
class singleton_class{
    static let share = singleton_class()
    var a: Int?
    var b: Int?
    private init() {}
    var name:String{
        get{
            return "tamil"
        }
    }
    var names:((String, Float, Int) -> Void)?{
        didSet{
            names?("swgfre", 0.5, 4)
        }
    }


    func text(){
        a = 10
        b = 10
        name
        return
    }
}
