//
//  ViewController.swift
//  table_segue_storage
//
//  Created by Kinderley Charles on 9/4/15.
//  Copyright © 2015 Kinderley Charles. All rights reserved.
//

// Notes
// Optional mean that there is a possibility that the var has no content
// To tell swift that the var has an actual content, use the exclamation mark

import UIKit

// Creating anything outside of the class is considered to be a global value
var arr = ["hey", "hope", "this", "hey"]

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        // This was just an example
//        var name = "Kinderley"
//        var age = 22
//        
//        NSUserDefaults.standardUserDefaults().setInteger(age, forKey: "age")
//        NSUserDefaults.standardUserDefaults().setObject(name, forKey: "name")
//        
//        let newName = NSUserDefaults.standardUserDefaults().objectForKey("name")
//        let newAge = NSUserDefaults.standardUserDefaults().integerForKey("age")
//        
//        print("\(newName) is \(age)")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

