//
//  CameraViewController.swift
//  Oval
//
//  Created by Kinderley Charles on 10/20/15.
//  Copyright © 2015 Kinderley Charles. All rights reserved.
//

import UIKit
import Parse

class CameraViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    // Variable declarations and definitions
    @IBOutlet var previewImg: UIImageView!
    @IBOutlet var caption: UITextField!
    @IBOutlet var clickOnPic: UITapGestureRecognizer!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Call to choose picture once camera is selected
        loadImageFromSrc()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func viewWillAppear(animated: Bool) {
        self.navigationController?.navigationBar
        navigationItem.title = "Camera"
    }
    
    // Load the Photo library as the source to pick the photo from
    func loadImageFromSrc() {
        let imgPicker = UIImagePickerController()
        imgPicker.delegate = self
        imgPicker.sourceType = UIImagePickerControllerSourceType.PhotoLibrary
        imgPicker.allowsEditing = true
        self.presentViewController(imgPicker, animated: true, completion: nil)
    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingImage image: UIImage, editingInfo: [String : AnyObject]?) {
        previewImg.image = image
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    // Change selected picture
    @IBAction func editPhoto(sender: UITapGestureRecognizer) {
        print("Gesture read")
        loadImageFromSrc()
    }
    
    // Upload image to database
    @IBAction func uploadImage(sender: AnyObject) {
        // Make sure that the image selected is not empty
        if previewImg.image != nil {
            let post = PFObject(className: "Photos")
            post["caption"] = caption?.text
            post["user_id"] = PFUser.currentUser()
            
            // Create PNG representation of image
            let imgData = UIImagePNGRepresentation(self.previewImg.image!)
            let imgFile = PFFile(name: "IMG.png", data: imgData!)
            post["file_name"] = imgFile
            
            post.saveInBackgroundWithBlock {
                (pass: Bool, err: NSError?) -> Void in
                if (pass) {
                    print("Uploaded successfully")
                    self.gotoPhotos()
                }
                else {
                    print(err)
                }
            }
        }
        else {
            print("ERROR: An image must be selected")
        }
    }

    // Go to photos if upload was successful
    func gotoPhotos() {
        let nextView:PhotosViewController = self.storyboard?.instantiateViewControllerWithIdentifier("photoCtrl") as! PhotosViewController
        self.presentViewController(nextView, animated: true, completion: nil)
    }
}
