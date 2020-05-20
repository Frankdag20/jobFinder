//
//  RegViewController.swift
//  jobFinderNJ
//
//  Created by Frank D'Agostino on 8/11/17.
//  Copyright © 2017 Frank D'Agostino. All rights reserved.
//

import UIKit

class RegViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var rName: UITextField!
    @IBOutlet weak var rEmail: UITextField!
    @IBOutlet weak var rPhoneNumber: UITextField!
    @IBOutlet weak var rPassword: UITextField!
    @IBOutlet weak var rPasswordRepeat: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.rName.delegate = self
        self.rEmail.delegate = self
        self.rPhoneNumber.delegate = self
        self.rPassword.delegate = self
        self.rPasswordRepeat.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    //Register Button Pressed Function
    @IBAction func registerButtonTapped(_ sender: Any) {
       
        //Check for empty fields
        if rName.text?.count == 0 || rEmail.text?.count == 0 || rPhoneNumber.text?.count == 0 || rPassword.text?.count == 0 || rPasswordRepeat.text?.count == 0 {
       
        //Alert
            //Create alert
            let alert = UIAlertController(title: "All fields must be filled", message: "Please fill out all fields in order to register your account.", preferredStyle: UIAlertControllerStyle.alert)
            //Add button
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
            //Present alert
            self.present(alert, animated: true, completion: nil)
            return
        //Check if passwords match
        } else if rPassword.text != rPasswordRepeat.text {
                
            //Alert
                //Create alert
                let alert = UIAlertController(title: "Passwords do not match", message: "Please make sure both passwords match in order to register your account.", preferredStyle: UIAlertControllerStyle.alert)
                //Add button
                alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
                //Present alert
                self.present(alert, animated: true, completion: nil)
                return
        //Store users (will be switched to Firebase once SDK is updated)
        } else {
            UserDefaults.standard.set(rName.text, forKey: "rName")
            UserDefaults.standard.set(rEmail.text, forKey: "rEmail")
            UserDefaults.standard.set(rPhoneNumber.text, forKey: "rPhoneNumber")
            UserDefaults.standard.set(rPassword.text, forKey: "rPassword")
            UserDefaults.standard.set(rPasswordRepeat.text, forKey: "rPasswordRepeat")
            UserDefaults.standard.synchronize()
            
        //Alert
            //Create alert
            let alert = UIAlertController(title: "Registration successful", message: "Please wait as your account is created.", preferredStyle: UIAlertControllerStyle.alert)
            //Add button
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: { action in
                self.dismiss(animated: true, completion: nil)
            }))
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
