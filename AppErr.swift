//
//  AppError.swift
//  FrameWorks
//
//  Created by thamizharasan t on 15/12/22.
//

import Foundation

enum AppError: Error{
    case invalidUserName
    case invalidDepartment
    case invalidEmailID
    case invalidPassword
    case invalidMobile
    case invalidDOB
    case invalidBloodGrp
    case invalidAddress
    case invalidUserImg
    
    case invalidCountry
    case invalidOTP
    

}

extension AppError: LocalizedError {
    
    var errorDescription: String? {
        switch self {
        case .invalidUserName:
            return "User name must be between 3 and 30 characters"
        case .invalidDepartment:
            return "Select employee department"
        case .invalidEmailID:
            return "Invalid email address"
        case .invalidPassword:
            return "Password must be between 6 and 15 characters"
        case .invalidMobile:
            return "Mobile number should be 10 digit"
        case .invalidDOB:
            return "Select employee Date of Birth"
        case .invalidBloodGrp:
            return "Enter employee Blood Group"
        case .invalidAddress:
            return "Address must be between 6 and 100 characters"
        case .invalidUserImg:
            return "Select user image"
            
        case .invalidCountry:
            return "Invalid country code"
        case .invalidOTP:
            return "Invalid OTP"
        }
    }
}


//
//  LoginViewModel.swift
//  FrameWorks
//
//  Created by thamizharasan t on 16/12/22.
//

import Foundation
class LoginViewModel{
    
    
    var didGetError: (()->())?

    var error:Error?{
        didSet{
            didGetError?()
        }
    }
    
    
    func Login(email:String,passwod:String) throws -> Bool {
        
        if isValidEmail(testStr: email) == false {
            throw AppError.invalidEmailID
        }else if passwod.count <= 6 {
            throw AppError.invalidPassword
        }else{
            print("success")
        }

        return true
    }
}

extension LoginViewModel{
    //EMAIL VALIDATION FUNCTION
        func isValidEmail(testStr: String) -> Bool {
            let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
            let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
            return emailTest.evaluate(with: testStr)
        }
}



//
//  ErrorHandlings.swift
//  FrameWorks
//
//  Created by thamizharasan t on 16/12/22.
//

import UIKit

class LoginVC: UIViewController {
    
    var viewModel = LoginViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
    
        observeViewModel()
       
    }

    func observeViewModel(){
        do{
          let result =  try viewModel.Login(email: "d@gmil.com", passwod: "wedq")
            print("ss:\(result)")
        } catch let errors  {
            print("err:\( errors.localizedDescription)")
    
        }
        
    
    }

}




