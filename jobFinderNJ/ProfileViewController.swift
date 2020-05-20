//
//  ProfileViewController.swift
//  jobFinderNJ
//
//  Created by Frank D'Agostino on 8/11/17.
//  Copyright © 2017 Frank D'Agostino. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {
 
        //Logout user
    @IBAction func logoutButtonPressed(_ sender: Any) {
        //Create alert
        let alert = UIAlertController(title: "Verification", message: "Are you sure you want to logout?", preferredStyle: UIAlertControllerStyle.alert)
        //Add button
        alert.addAction(UIAlertAction(title: "Continue", style: UIAlertActionStyle.default, handler: { action in
            //Set userIsLoggedIn to false
            UserDefaults.standard.set(false, forKey: "isUserLoggedIn")
            UserDefaults.standard.synchronize()
            self.performSegue(withIdentifier: "profileToLogin", sender: self)
        }))
        alert.addAction(UIAlertAction(title: "Cancel", style: UIAlertActionStyle.cancel, handler: nil))
        //Present alert
        self.present(alert, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        let isUserLoggedIn = UserDefaults.standard.bool(forKey: "isUserLoggedIn")
        if !isUserLoggedIn {
            self.performSegue(withIdentifier: "profileToLogin", sender: self)
            return
        }
    
    }

}
