//
//  ViewController.swift
//  csr-chat
//
//  Created by Brandon Sugarman on 5/22/19.
//  Copyright © 2019 Brandon Sugarman. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBAction func goLoginScreen(_ sender: UIButton) {
        CSRMethods.app.changeScreens(id: "login")
    }
    
    @IBAction func goSignUpScreen(_ sender: UIButton) {
        CSRMethods.app.changeScreens(id: "signup")
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

