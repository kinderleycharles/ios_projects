//
//  HomeViewController.swift
//  Oval
//
//  Created by Kinderley Charles on 10/19/15.
//  Copyright © 2015 Kinderley Charles. All rights reserved.
//

import UIKit
import Parse

class HomeViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var users = [PFObject]()
    
    @IBOutlet weak var tab: UITableView!
    @IBOutlet var welcomeMsg: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        printWelcomeMessage()
        fillArrWithUsers()
    }
    
    func printWelcomeMessage() {
        // Print welcome message
        welcomeMsg.text = "Hi, " + (PFUser.currentUser()?.username)!
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    override func viewWillAppear(animated: Bool) {
        self.navigationController?.navigationBar
        let titleLogo = UIImageView(frame: CGRect(x: 0, y: 0, width: 71, height: 34))
        titleLogo.contentMode = .ScaleAspectFit
        titleLogo.image = UIImage(named: "pg_Logo.png")
        navigationItem.titleView = titleLogo
    }
    
    func fillArrWithUsers() {
        let query : PFQuery = PFQuery(className: "_User")
        query.findObjectsInBackgroundWithBlock{ (objects: [PFObject]?, error: NSError?) -> Void in
            if error == nil {
                for obj in objects! {
                    print(obj["username"])
                    self.users.append(obj)
                }
                self.tab.reloadData()
            }
            else {
                print("object retrieved FAILED")
            }
        }
    }
    
    
    @IBAction func logout(sender: AnyObject) {
        // For debugging purposes
        print("Logging out")
        
        // Logout from Parse
        PFUser.logOut()
        
        // Go back to root view controller which is the login page
        let loginViewController = self.storyboard!.instantiateViewControllerWithIdentifier("loginView")
        UIApplication.sharedApplication().keyWindow?.rootViewController = loginViewController
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        // To be used to add friends to user
        let addFriend:PFUser = users[indexPath.row] as! PFUser
        let currUser:PFObject = PFUser.currentUser() as! PFObject
        var fArr = [String]()
        
        // Prevent user from adding himself or herself
        if addFriend.objectId != PFUser.currentUser()?.objectId {
            if currUser["friends"] == nil {
                fArr.append(addFriend.objectId!)
            }
            else {
                fArr = currUser["friends"] as! [String]
                for k in fArr {
                    if addFriend.objectId == k {
                        // User is already friend, Do not add
                        return
                    }
                }
                fArr.append(addFriend.objectId!)
            }
            currUser["friends"] = fArr
            currUser.saveEventually()
        }
        
    }
    

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let userInfo: PFObject = self.users[indexPath.row] as PFObject
        let cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: "allUsers")
        cell.textLabel?.text = String(userInfo["username"])
        return cell
        
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.users.count
    }
}
