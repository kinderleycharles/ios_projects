//
//  ViewController.swift
//  tic_tac_toe
//
//  Created by Kinderley Charles on 9/14/15.
//  Copyright © 2015 Kinderley Charles. All rights reserved.
//

import UIKit
var wPlayers = [[String]]()

class ViewController: UIViewController {

    // Variables
    let gameInstruction = "The goal of Tic Tac Toe is to get three in a row. You play on a three by three game board. The first player is known as X and the second is O. Players alternate placing Xs and Os on the game board until either oppent has three in a row or all nine squares are filled. X always goes first, and in the event that no one has three in a row, the stalemate is called a cat game."
    
    // Variables to print instruction
    @IBOutlet var intrucMessage: UILabel!
    @IBOutlet var insMessage: UILabel? // Intro message
    @IBOutlet var ticTacImg1: UIImageView? = nil
    @IBOutlet var ticTacImg2: UIImageView? = nil
    @IBOutlet var ticTacImg3: UIImageView? = nil
    @IBOutlet var ticTacImg4: UIImageView? = nil
    @IBOutlet var ticTacImg5: UIImageView? = nil
    @IBOutlet var ticTacImg6: UIImageView? = nil
    @IBOutlet var ticTacImg7: UIImageView? = nil
    @IBOutlet var ticTacImg8: UIImageView? = nil
    @IBOutlet var ticTacImg9: UIImageView? = nil
    
    // Tap Getures recognizer
    @IBOutlet var pos11: UITapGestureRecognizer!
    @IBOutlet var pos12: UITapGestureRecognizer!
    @IBOutlet var pos13: UITapGestureRecognizer!
    @IBOutlet var pos21: UITapGestureRecognizer!
    @IBOutlet var pos22: UITapGestureRecognizer!
    @IBOutlet var pos23: UITapGestureRecognizer!
    @IBOutlet var pos31: UITapGestureRecognizer!
    @IBOutlet var pos32: UITapGestureRecognizer!
    @IBOutlet var pos33: UITapGestureRecognizer!
    
    
    // Player variables
    var player: Int = 0 // indicate player turn
    var icon: String = ""
    var player1: String = ""
    var player2: String = ""
    var screPlyr1: Int = 0
    var screPlyr2: Int = 0
    var round: Int  = 0
    var game: Int = 0
    var validEntry: Bool = false
    var loc: Int = 0
    var arr = [[Int]]()

    
    // Main Game variables
    @IBOutlet var namePlyr1: UILabel?
    @IBOutlet var namePlyr2: UILabel?
    @IBOutlet var scorePlyr1: UILabel?
    @IBOutlet var scorePlyr2: UILabel?
    @IBOutlet var roundMes: UILabel?
    @IBOutlet var plyrTurn: UILabel?
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        // Print all the information on game board
        initGame()
        drawTest()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    // Matrix click location
    @IBAction func loc11(sender: UITapGestureRecognizer) {
        loc = 1
        runGame()
    }
    @IBAction func loc12(sender: UITapGestureRecognizer) {
        loc = 2
        runGame()
    }
    @IBAction func loc13(sender: UITapGestureRecognizer) {
        loc = 3
        runGame()
    }
    @IBAction func loc21(sender: UITapGestureRecognizer) {
        loc = 4
        runGame()
    }
    @IBAction func loc22(sender: UITapGestureRecognizer) {
        loc = 5
        runGame()
    }
    @IBAction func loc23(sender: UITapGestureRecognizer) {
        loc = 6
        runGame()
    }
    @IBAction func loc31(sender: UITapGestureRecognizer) {
        loc = 7
        runGame()
    }
    @IBAction func loc32(sender: UITapGestureRecognizer) {
        loc = 8
        runGame()
    }
    @IBAction func loc33(sender: UITapGestureRecognizer) {
        loc = 9
        runGame()
    }
    
    // Switching player turns
    func switchPlayer() {
        if player == 1 {
            player = 2
            icon = "o"
        }
        else {
            player = 1
            icon = "x"
        }
    }
    
    // Function contain the algorithm for the game
    func runGame() {
        setImage(loc)   // Place user location
        // Test for winnings and draw
        if winStateTest() != 0 {
            if round == 3 {
                updateScoreBoard()
                game++
                switchControllerView()
            }
            else {
                round++
                resetBoard()
                printInfoGameBoard()
                
                // Prevent prgram from switching player after round end
                return
            }
        }
        switchPlayer()  // Make it other player turn
        printInfoGameBoard()
    }
    
    func updateScoreBoard() {
        if screPlyr1 > screPlyr2 {
            wPlayers.append(["\(player1) Won against \(player2)"])
        }
        else if screPlyr2 > screPlyr1 {
            wPlayers.append(["\(player2) Won against \(player1)"])
        }
        else {
            wPlayers.append(["Game Tied"])
        }
    }
    
    // This function swith the controller view after a round is over
    func switchControllerView() {
        let nextView:gameStatsViewController = self.storyboard?.instantiateViewControllerWithIdentifier("gameStat") as! gameStatsViewController
        
        self.presentViewController(nextView, animated: true, completion: nil)
    }
    
    // Check if the game won
    func winStateTest() -> Int {
        
        var winner = 0
        // Diagonal Check
        if ( arr[0][0] != 0 && ((arr[0][0] == arr[1][1]) && (arr[1][1] == arr[2][2])) ) {
            winner = arr[1][1]
        }
        else if ( arr[1][2] != 0 && (arr[1][2] == arr[1][1]) && (arr[1][1] == arr[2][1])) {
              winner = arr[1][1]
        }
        // Vertical tic tac toe test
        else if ( arr[0][0] != 0 && ((arr[0][0] == arr[1][0]) && (arr[1][0] == arr[2][0])) ) {
            winner = arr[0][0]
        }
        else if ( arr[1][0] != 0 && ((arr[1][0] == arr[1][1]) && (arr[1][1] == arr[1][2])) ) {
            winner = arr[1][0]
        }
        else if( arr[2][0] != 0 && ((arr[2][0] == arr[2][1]) && (arr[2][1] == arr[2][2])) ) {
            winner = arr[2][0]
        }
        // Horizontal tic tac toe test
        else if ( arr[0][0] != 0 && ((arr[0][0] == arr[0][1]) && (arr[0][1] == arr[0][2])) ) {
            winner = arr[0][0]
        }
        else if ( arr[1][0] != 0 && ((arr[1][0] == arr[1][1]) && (arr[1][1] == arr[1][2])) ) {
            winner = arr[1][0]
        }
        else if ( arr[2][0] != 0 && ((arr[2][0] == arr[2][1]) && (arr[2][1] == arr[2][2])) ) {
            winner = arr[2][0]
        }
        else {
            if drawTest() == true {
                winner = -1 // Game result in draw
            }
            else {
                winner = 0
            }
        }
        
        // Update player scores
        updatePlayerScores(winner)
        return winner
    }
    
    
    // Update players scores
    func updatePlayerScores(pWinner: Int) {
        // If it is player 1
        if pWinner == 1 {
            screPlyr1++
        }
        else if pWinner == 2 {
            screPlyr2++
        }
        else {
            // Do nothing
        }
    }
    
    // Test for draw in game
    func drawTest() -> Bool {
        var ans: Bool = true
        for y in 0...2 {
            for x in 0...2 {
                if arr[y][x] == 0 {
                    ans = false
                }
            }
        }
        
        print("\(arr[0][0]) \(arr[0][1]) \(arr[0][2]) \n")
        print("\(arr[1][0]) \(arr[1][1]) \(arr[1][2]) \n")
        print("\(arr[2][0]) \(arr[2][1]) \(arr[2][2]) \n\n")
        return ans
    }
    
    // Initialize all the variables for the game
    func initGame() {
        // Get player name from previous controller
        game = 1
        round = 1
        screPlyr1 = 0
        screPlyr2 = 0
        self.arr = [[0,0,0],[0,0,0],[0,0,0]]
        
        // Reset board
        resetBoard()
        printInfoGameBoard()
    }
    
    // Move to next round
    func resetBoard() {
        // Clear backgroung array
        player = 1
        icon = "x"
        self.arr = [[0,0,0],[0,0,0],[0,0,0]]
        
        // Reset buttons
        ticTacImg1?.image = UIImage(named: "defaultButton")
        ticTacImg2?.image = UIImage(named: "defaultButton")
        ticTacImg3?.image = UIImage(named: "defaultButton")
        ticTacImg4?.image = UIImage(named: "defaultButton")
        ticTacImg5?.image = UIImage(named: "defaultButton")
        ticTacImg6?.image = UIImage(named: "defaultButton")
        ticTacImg7?.image = UIImage(named: "defaultButton")
        ticTacImg8?.image = UIImage(named: "defaultButton")
        ticTacImg9?.image = UIImage(named: "defaultButton")
    }
    
    
    func setImage(matLoc: Int) {
        
        switch matLoc {
        case 1:
            ticTacImg1?.image = UIImage(named: icon)
            arr[0][0] = player
        case 2:
            ticTacImg2?.image = UIImage(named: icon)
            arr[0][1] = player
        case 3:
            ticTacImg3?.image = UIImage(named: icon)
            arr[0][2] = player
        case 4:
            ticTacImg4?.image = UIImage(named: icon)
            arr[1][0] = player
        case 5:
            ticTacImg5?.image = UIImage(named: icon)
            arr[1][1] = player
        case 6:
            ticTacImg6?.image = UIImage(named: icon)
            arr[1][2] = player
        case 7:
            ticTacImg7?.image = UIImage(named: icon)
            arr[2][0] = player
        case 8:
            ticTacImg8?.image = UIImage(named: icon)
            arr[2][1] = player
        case 9:
            ticTacImg9?.image = UIImage(named: icon)
            arr[2][2] = player
        default:
            ticTacImg1?.image = UIImage(named: icon)
        }
    }
    
    // Print all information on game board
    func printInfoGameBoard() {
        
        // Players' name
        namePlyr1?.text = player1
        namePlyr2?.text = player2
        
        // Players' score
        scorePlyr1?.text = "\(screPlyr1)"
        scorePlyr2?.text = "\(screPlyr2)"
        
        roundMes?.text = "Round \(round)"
        if player == 1 {
            plyrTurn?.text = "Game: \(game)\t\t ---> Your turn \(player1)"
        }
        else if player == 2 {
            plyrTurn?.text = "Game: \(game)\t\t ---> Your turn \(player2)"
        }
        else {}
        
    }
}

