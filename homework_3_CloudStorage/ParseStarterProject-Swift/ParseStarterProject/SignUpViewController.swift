//
//  SignUpViewController.swift
//  ParseStarterProject-Swift
//
//  Created by Kinderley Charles on 10/15/15.
//  Copyright © 2015 Parse. All rights reserved.
//

import UIKit
import Parse

class SignUpViewController: UIViewController, UITextFieldDelegate {
    
    // Variables definition and declarations
    @IBOutlet var newUser_username: UITextField!
    @IBOutlet var newUser_password: UITextField!
    @IBOutlet var newUser_passwordConfirmed: UITextField!
    @IBOutlet var newUser_firstName: UITextField!
    @IBOutlet var newUser_lastName: UITextField!
    @IBOutlet var newUser_email: UITextField!
    @IBOutlet var newUser_bd: UIDatePicker!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func isInfoValid() -> Bool {
        if (newUser_firstName.text == "" || newUser_lastName == "" ||
            newUser_email == "" || newUser_username == "" ||
            newUser_password == "" || newUser_passwordConfirmed == "") {
                
                // Print message: Fill out all fields
                return false
        }
        return true
    }
    
    // Process information submitted by user
    @IBAction func processInfo(sender: AnyObject) {
        if isInfoValid() {
            
            // Create user
            let user = PFUser()
            user.username = newUser_username.text
            user.password = newUser_password.text
            user.email = newUser_email.text
            
            user.signUpInBackgroundWithBlock {
                (succeeded: Bool, error: NSError?) -> Void in
                if let error = error {
                    let errorStr = error.userInfo["error"] as? NSString
                    print(errorStr)
                }
                else {
                    print("Proceed to Welcome Page")
                }
            }
        }
    }
    
}
