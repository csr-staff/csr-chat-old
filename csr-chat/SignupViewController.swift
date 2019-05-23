//
//  SignupViewController.swift
//  csr-chat
//
//  Created by Brandon Sugarman on 5/22/19.
//  Copyright © 2019 Brandon Sugarman. All rights reserved.
//

import UIKit

class SignupViewController: UIViewController {

    
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var confirmPasswordTextField: UITextField!
    
    @IBAction func toHomeScreen(_ sender: UIButton) {
        CSRMethods.app.changeScreens(id: "home")
    }
    
    @IBAction func trySignUp(_ sender: UIButton) {
        
        
        if passwordTextField.text! != confirmPasswordTextField.text! {
            CSRMethods.app.showAlert(titleMessage: "CSR Alert",messageString: "Passwords do not match.")
            return
        }
        if emailTextField == nil {
            CSRMethods.app.showAlert(titleMessage: "CSR Alert",messageString: "Email has no entry.")
            return
        }
        
        if usernameTextField == nil {
            CSRMethods.app.showAlert(titleMessage: "CSR Alert",messageString: "Username has no entry.")
            return
        }
        if passwordTextField == nil {
            CSRMethods.app.showAlert(titleMessage: "CSR Alert",messageString: "Password has no entry.")
            return
        }
        
        if confirmPasswordTextField == nil {
            CSRMethods.app.showAlert(titleMessage: "CSR Alert",messageString: "Confirm password has no entry.")
            return
        }
        
        UserDefaults.standard.set(usernameTextField.text!, forKey: "username")
        CSRMethods.app.signUp(username: usernameTextField.text!, email: emailTextField.text!, password: passwordTextField.text!)
        
        
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        passwordTextField.isSecureTextEntry = true
        confirmPasswordTextField.isSecureTextEntry = true
        
        
        
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
