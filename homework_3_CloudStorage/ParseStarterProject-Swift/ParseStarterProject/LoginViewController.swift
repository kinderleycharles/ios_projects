//
//  LoginViewController.swift
//  ParseStarterProject-Swift
//
//  Created by Kinderley Charles on 10/15/15.
//  Copyright © 2015 Parse. All rights reserved.
//

import UIKit
import Parse

class LoginViewController: UIViewController {

    // Variable declaration and definitions
    @IBOutlet var username: UITextField!
    @IBOutlet var password: UITextField!
    @IBOutlet var message: UILabel!
    @IBOutlet var signUp: UITapGestureRecognizer!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
    
    // Go to the sign up page
    @IBAction func goToSignUp(sender: AnyObject) {
        let nextView:SignUpViewController = self.storyboard?.instantiateViewControllerWithIdentifier("signUpView") as! SignUpViewController
        self.presentViewController(nextView, animated: false, completion: nil)
    }
    
    // Go to the main controller of the app for the user to being enjoy Oval
    func goHome() {
        let nextView:HomeViewController = self.storyboard?.instantiateViewControllerWithIdentifier("home") as! HomeViewController
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
                self.printMessage("Username/Password does not match")
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
