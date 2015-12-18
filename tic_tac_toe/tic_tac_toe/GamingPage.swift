//
//  GamingPage.swift
//  tic_tac_toe
//
//  Created by Kinderley Charles on 9/14/15.
//  Copyright © 2015 Kinderley Charles. All rights reserved.
//

import UIKit

// This class only contains the instruction
class GamingPage: UIViewController {

    // Interface outlets and function
    @IBOutlet var insMessage: UILabel! //introduction instructions
    
    // Variables
    let instructions = "The goal of Tic Tac Toe is to get three in a row. You play on a three by three game board. The first player is known as X and the second is O. Players alternate placing Xs and Os on the game board until either oppent has three in a row or all nine squares are filled. X always goes first, and in the event that no one has three in a row, the stalemate is called a cat game."
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        printInfo(instructions)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // Print instruction
    func printInfo(ins: String) {
        insMessage.text = ins
    }
    

}
