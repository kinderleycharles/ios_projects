//
//  SignUpViewController.swift
//  Oval
//
//  Created by Kinderley Charles on 10/19/15.
//  Copyright © 2015 Kinderley Charles. All rights reserved.
//

import UIKit
import Parse

class SignUpViewController: UIViewController {

    // Variable declaration and definitions
    @IBOutlet var new_username: UITextField!
    @IBOutlet var new_pwd: UITextField!
    @IBOutlet var new_pwd_confirmed: UITextField!
    @IBOutlet var new_email: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func createAccount(sender: AnyObject) {
        if isInfoValid() {
            // Create user
            let user = PFUser()
            user.username = new_username.text
            user.password = new_pwd.text
            user.email = new_email.text
            
            user.signUpInBackgroundWithBlock {
                (succeeded: Bool, error: NSError?) -> Void in
                if let error = error {
                    let errorStr = error.userInfo["error"] as? NSString
                    print(errorStr)
                }
                else {
                    print("Proceed to Welcome Page")
                    self.goHome()
                }
            }
        }
        else {
            print("Error in submitted forms")
        }
    }
    
    func goHome() {
        let nextView:HomeViewController = self.storyboard?.instantiateViewControllerWithIdentifier("home") as! HomeViewController
        self.presentViewController(nextView, animated: true, completion: nil)
    }
    
    func isInfoValid() -> Bool {
        if (new_username.text == "" || new_pwd.text == "" ||
            new_pwd_confirmed.text == "" || new_email == "") {
                // Print message: Fill out all fields
                return false
        }
        
        // Check that same password is entered twice
        if( new_pwd.text != new_pwd_confirmed.text) {
            return false
        }
        return true
    }
}
