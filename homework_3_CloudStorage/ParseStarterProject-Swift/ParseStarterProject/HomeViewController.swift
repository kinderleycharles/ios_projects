//
//  HomeViewController.swift
//  ParseStarterProject-Swift
//
//  Created by Kinderley Charles on 10/18/15.
//  Copyright © 2015 Parse. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func viewDidAppear(animated: Bool) {
        // 1
        var nav = self.navigationController?.navigationBar
        // 2
        nav?.barStyle = UIBarStyle.Black
        nav?.tintColor = UIColor.yellowColor()
        // 3
        let bg = UIImageView(frame: CGRect(x: 0, y:0, width: 320, height: 44))
        bg.contentMode = .TopLeft
        let bgPic = UIImage(named: "bckground2.jpg")
        
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 71, height: 34))
        imageView.contentMode = .ScaleAspectFit
        // 4
        let image = UIImage(named: "Apple_Swift_Logo")
        imageView.image = image
        // 5
        navigationItem.titleView = imageView
    }
}
