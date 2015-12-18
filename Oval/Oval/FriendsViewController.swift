//
//  FriendsViewController.swift
//  Oval
//
//  Created by Kinderley Charles on 10/20/15.
//  Copyright © 2015 Kinderley Charles. All rights reserved.
//

import UIKit
import Parse


class FriendsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    // Variable Declarations and Definitions
    var test = [String]()
    var users = [PFObject]()
    var selUser: String!
    
    @IBOutlet weak var friendsList: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        loadFriends()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func viewWillAppear(animated: Bool) {
        self.navigationController?.navigationBar
        navigationItem.title = "My Friends"
    }
    
    func loadFriends() {
        let currUser:PFObject = PFUser.currentUser() as! PFObject
        if currUser["friends"] == nil {
            return
        }
        else {
        let fList:[String] = currUser["friends"] as! [String]
        for friend in fList {
            let query : PFQuery = PFQuery(className: "_User")
            query.whereKey("objectId", equalTo:friend)
            query.findObjectsInBackgroundWithBlock{ (objects: [PFObject]?, error: NSError?) -> Void in
                if error == nil {
                    for obj in objects! {
                        print(obj["username"])
                        self.users.append(obj)
                    }
                }
                self.friendsList.reloadData()
            }
        }
        }
    }
    
    
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        selectedUser = self.users[indexPath.row] as! PFUser
        
        
        // Go to Profile View controller
        let nextView:ProfileViewController = self.storyboard?.instantiateViewControllerWithIdentifier("profile") as! ProfileViewController
        self.presentViewController(nextView, animated: true, completion: nil)
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let userInfo: PFObject = users[indexPath.row] as PFObject
        let cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: "friends")
        cell.textLabel?.text = String(userInfo["username"])
        return cell
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count
    }
}
