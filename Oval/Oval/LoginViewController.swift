//
//  LoginViewController.swift
//  Oval
//
//  Created by Kinderley Charles on 10/19/15.
//  Copyright © 2015 Kinderley Charles. All rights reserved.
//

import UIKit
import Parse

class LoginViewController: UIViewController {

    // Variable declaration and definitions
    @IBOutlet var username: UITextField!
    @IBOutlet var password: UITextField!
    @IBOutlet var message: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func signIn(sender: AnyObject) {
        if username.text != "" && password.text != "" {
            checkUserCredentials()
        }
        else if username.text == "" {
            printMessage("Username is missing")
        }
        else {
            printMessage("Password is missing")
        }
    }
    
    
    // Go to the main controller of the app for the user to being enjoy Oval
    func goHome() {
        let nextView:UINavigationController = self.storyboard?.instantiateViewControllerWithIdentifier("home") as! UINavigationController
        self.presentViewController(nextView, animated: true, completion: nil)
    }
    
    // Check the user credential then proceed if necessary
    func checkUserCredentials() {
        PFUser.logInWithUsernameInBackground (username.text!, password:password.text!) {
            (user: PFUser?, Error: NSError?) -> Void in
            if user != nil {
                // Check the credentials of the user
                if (self.username.text != "" && self.password.text != "") {
                    PFUser.logInWithUsernameInBackground(self.username.text!, password:self.password.text!) {
                        (user: PFUser?, error: NSError?) -> Void in
                        if user != nil {
                            // Do stuff after successful login.
                            print("You logged in")
                            self.goHome()
                        }
                        else {
                            print(error?.description)
                        }
                    }
                }
            }
            else {
                self.printMessage("User does not match")
            }
        }
    }
    
    // Print an error message to the user
    func printMessage(msg: String) {
        message.text = msg
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        // Get rid of keyboard once user click outside keyboard
        self.view.endEditing(true)
    }
}
