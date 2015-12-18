//
//  PlayerInfoViewController.swift
//  tic_tac_toe
//
//  Created by Kinderley Charles on 9/20/15.
//  Copyright © 2015 Kinderley Charles. All rights reserved.
//

import UIKit

class PlayerInfoViewController: UIViewController {

    @IBOutlet var enterPlyr1: UITextField!
    @IBOutlet var enterPlyr2: UITextField!
    @IBOutlet var plyrNamingError: UILabel!
    
    var validEntry: Bool = false
    var player1: String = ""
    var player2: String = ""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // Sending player information to second controller
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        var gameCV: ViewController = segue.destinationViewController as! ViewController
        gameCV.player1 = enterPlyr1!.text!
        gameCV.player2 = enterPlyr2!.text!
        
        // Input validation
        if enterPlyr1 == nil {
            plyrNamingError?.text = "Error: Enter a name for Player 1"
        }
        else if enterPlyr2 == nil {
            plyrNamingError?.text = "Error: Enter a name for Player 2"
        }
        else if enterPlyr1 == enterPlyr2 {
            plyrNamingError?.text = "Error: Enter another name for, Player 2"
        }
        else {
            validEntry = true
        }
        
    }

}
