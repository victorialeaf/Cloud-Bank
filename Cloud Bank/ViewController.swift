//
//  ViewController.swift
//  Cloud Bank
//
//  Created by Victoria Leaf on 11/16/17.
//  Copyright © 2017 Victoria Leaf. All rights reserved.
//

import UIKit
import Firebase

class ViewController: UIViewController {

    @IBOutlet weak var txtPassword: UITextField!
    @IBOutlet weak var txtEmail: UITextField!
    
    @IBAction func btnLogin(_ sender: Any) {
        if let email = txtEmail.text, let password = txtPassword.text
        {
            Auth.auth().signIn(withEmail: email, password: password) { (user, error) in
                
                if user != nil{
                    
                    let vc = UIStoryboard(name:"accounts", bundle: nil).instantiateInitialViewController()
                    self.navigationController?.pushViewController(vc!, animated: true)
                    self.present(vc!, animated: true, completion: nil)
                }
                else {
                    let alertController = UIAlertController(title: "Login Failed", message: (error?.localizedDescription)!, preferredStyle: UIAlertControllerStyle.alert)
                    let okAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default){
                        (result : UIAlertAction) -> Void in print ("OK")
                    }
                    alertController.addAction(okAction)
                    self.present(alertController, animated: true, completion: nil)
                }
            }
        }
    }
    override func touchesBegan(_ touches: Set <UITouch>, with even: UIEvent?){
        txtEmail.resignFirstResponder()
        txtPassword.resignFirstResponder()
    }
}

