//
//  ViewController.swift
//  Oval
//
//  Created by Kinderley Charles on 10/19/15.
//  Copyright © 2015 Kinderley Charles. All rights reserved.
//

import UIKit
import Parse

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Call to switch to next view controller after 1 seconds
        var nxtStep = ""
        if (PFUser.currentUser() != nil) {
            nxtStep = "goToHome"
        }
        else {
           nxtStep = "goToLoginPage"
        }
        NSTimer.scheduledTimerWithTimeInterval(0.0, target: self, selector: Selector.init(nxtStep), userInfo: nil, repeats: false)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // Go to the main controller of the app for the user to being enjoy Oval
    func goToHome() {
        let nextView:UINavigationController = self.storyboard?.instantiateViewControllerWithIdentifier("home") as! UINavigationController
        self.presentViewController(nextView, animated: true, completion: nil)
        
    }
    
    // This function automatically load the next View Controller
    func goToLoginPage() {
        let nextView:LoginViewController = self.storyboard?.instantiateViewControllerWithIdentifier("loginView") as! LoginViewController
        self.presentViewController(nextView, animated: true, completion: nil)
    }
}

