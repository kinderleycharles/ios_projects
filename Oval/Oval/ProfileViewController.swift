//
//  ProfileViewController.swift
//  Oval
//
//  Created by Kinderley Charles on 10/23/15.
//  Copyright © 2015 Kinderley Charles. All rights reserved.
//

import UIKit
import Parse

var selectedUser =  PFUser()
class ProfileViewController: UIViewController {
    
    @IBOutlet weak var pofPhotoTab: UITableView!
    var users = [PFObject]()
    
    @IBOutlet weak var userProfile: UILabel!
    @IBOutlet weak var userPhoto: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        print(selectedUser.username)
        userProfile.text = selectedUser.username! + "'s profile"
        userPhoto.text = selectedUser.username! + "'s photos"
        fillArrWithUsers()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func fillArrWithUsers() {
        let query : PFQuery = PFQuery(className: "Photos")
        query.whereKey("user_id", equalTo: selectedUser)
        query.findObjectsInBackgroundWithBlock{ (objects: [PFObject]?, error: NSError?) -> Void in
            if error == nil {
                for obj in objects! {
                    self.users.append(obj)
                }
                self.pofPhotoTab.reloadData()
            }
            else {
                print("object retrieved FAILED")
            }
        }
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let userInfo: PFObject = self.users[indexPath.row] as PFObject
        let cell = tableView.dequeueReusableCellWithIdentifier("friendPhoto", forIndexPath: indexPath) as! NewCustom
        if let userPicture = userInfo["file_name"] as? PFFile {
            userPicture.getDataInBackgroundWithBlock { (imageData: NSData?, error: NSError?) -> Void in
                if (error == nil) {
                    cell.picture.image = UIImage(data:imageData!)
                }
            }
        }
        return cell
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.users.count
    }
}
