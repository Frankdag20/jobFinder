//
//  ViewController.swift
//  jobFinderNJ
//
//  Created by Frank D'Agostino on 8/11/17.
//  Copyright © 2017 Frank D'Agostino. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var siEmail: UITextField!
    @IBOutlet weak var siPassword: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.siEmail.delegate = self
        self.siPassword.delegate = self
     
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
       
    }
    
    //Sign-in button pressed
    @IBAction func loginButtonTapped(_ sender: Any) {
        let lEmail = siEmail.text
        let lPassword = siPassword.text
        let emailStored = UserDefaults.standard.string(forKey: "rEmail")
        let passwordStored = UserDefaults.standard.string(forKey: "rPassword")
        
        //Check for empty fields
        if siEmail.text?.count == 0 || siPassword.text?.count == 0 {
            //Alert
            
            //Create alert
            let alert = UIAlertController(title: "All fields must be filled", message: "Please fill out all fields in order to sign-in.", preferredStyle: UIAlertControllerStyle.alert)
            
            //Add button
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
           
            //Present alert
            self.present(alert, animated: true, completion: nil)
            return
           
        } else if emailStored == lEmail {
                if passwordStored == lPassword {
                //Login is successful
                    //Alert
                    
                    //Create alert
                    let alert = UIAlertController(title: "Login successful", message: "Please wait as your profile is obtained.", preferredStyle: UIAlertControllerStyle.alert)
                   
                    //Add button
                    alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: { action in
                        //Store information
                        UserDefaults.standard.set(true, forKey: "isUserLoggedIn")
                        UserDefaults.standard.synchronize()
                        self.performSegue(withIdentifier: "signInToProfile", sender: self)
                    }))
                    
                    //Present alert
                    self.present(alert, animated: true, completion: nil)
                    return
                } else {
                    //Alert
                    
                    //Create alert
                    let alert = UIAlertController(title: "Incorrect password", message: "Please make sure the password was typed in correctly.", preferredStyle: UIAlertControllerStyle.alert)
                    
                    //Add button
                    alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
                    
                    //Present alert
                    self.present(alert, animated: true, completion: nil)
                    return
                }
            } else {
                //Alert
            
                //Create alert
                let alert = UIAlertController(title: "Email not recognized", message: "Please make sure the email was typed in correctly.", preferredStyle: UIAlertControllerStyle.alert)
            
                //Add button
                alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
            
                //Present alert
                self.present(alert, animated: true, completion: nil)
                return
            }
    }
    
    //Return Key Dismisses Keyboard
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }

}

