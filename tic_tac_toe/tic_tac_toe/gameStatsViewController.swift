//
//  gameStatsViewController.swift
//  tic_tac_toe
//
//  Created by Kinderley Charles on 9/20/15.
//  Copyright © 2015 Kinderley Charles. All rights reserved.
//

import UIKit

class gameStatsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        if NSUserDefaults.standardUserDefaults().objectForKey("tableContent") != nil
        {
            
            let tempContent = NSUserDefaults.standardUserDefaults().objectForKey("tableContent")! as! [Int]
            
            for i in tempContent
            {
                wPlayers.append(["\(tempContent[i])"])
                
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return wPlayers.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: "scoreCell")
        cell.textLabel!.text = String(wPlayers[indexPath.row])
        return cell
    }

}
