//
//  PhotosViewController.swift
//  Oval
//
//  Created by Kinderley Charles on 10/20/15.
//  Copyright © 2015 Kinderley Charles. All rights reserved.
//

import UIKit
import Parse

class PhotosViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var users = [PFObject]()
    
    @IBOutlet weak var tabPhotos: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.fillArrWithUsers()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(animated: Bool) {
        self.navigationController?.navigationBar
        navigationItem.title = "My Photos"
    }
    
    func fillArrWithUsers() {
        let query : PFQuery = PFQuery(className: "Photos")
        query.whereKey("user_id", equalTo: PFUser.currentUser()!)
        query.findObjectsInBackgroundWithBlock{ (objects: [PFObject]?, error: NSError?) -> Void in
            if error == nil {
                for obj in objects! {
                    print(obj["caption"])
                    self.users.append(obj)
                }
                self.tabPhotos.reloadData()
            }
            else {
                print("object retrieved FAILED")
            }
        }
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let userInfo: PFObject = self.users[indexPath.row] as PFObject
        let cell = tableView.dequeueReusableCellWithIdentifier("photo", forIndexPath: indexPath) as! CustomCellTableViewCell
        cell.caption.text = String(userInfo["caption"])
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
