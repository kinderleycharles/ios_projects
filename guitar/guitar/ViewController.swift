//
//  ViewController.swift
//  guitar
//
//  Created by Kinderley Charles on 9/14/15.
//  Copyright © 2015 Kinderley Charles. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    @IBOutlet weak var one: UILabel!
    @IBOutlet weak var two: UILabel!
    @IBOutlet weak var three: UILabel!
    @IBOutlet weak var four: UILabel!
    @IBOutlet weak var five: UILabel!
    @IBOutlet weak var six: UILabel!
    
    var shake = AVAudioPlayer()
    let shakePath = NSBundle.mainBundle().pathForResource("maraca", ofType: "mp3")
    
    // Sounds of the guitar
    let E = NSBundle.mainBundle().pathForResource("eLowTrimmed", ofType: "m4a")
    let A = NSBundle.mainBundle().pathForResource("aTrimmed", ofType: "m4a")
    let D = NSBundle.mainBundle().pathForResource("dTrimmed", ofType: "m4a")
    let G = NSBundle.mainBundle().pathForResource("gTrimmed", ofType: "m4a")
    let B = NSBundle.mainBundle().pathForResource("bTrimmed", ofType: "m4a")
    let e = NSBundle.mainBundle().pathForResource("eHighTrimmed", ofType: "m4a")
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let swipeUp = UISwipeGestureRecognizer(target: self, action: "swiped:")
        swipeUp.direction = UISwipeGestureRecognizerDirection.Up
        
        
        let swipeDown = UISwipeGestureRecognizer(target: self, action: "swiped:")
        swipeDown.direction = UISwipeGestureRecognizerDirection.Down
        
        
        let swipeLeft = UISwipeGestureRecognizer(target: self, action: "swiped:")
        swipeLeft.direction = UISwipeGestureRecognizerDirection.Left
        
        
        let swipeRight = UISwipeGestureRecognizer(target: self, action: "swiped:")
        swipeRight.direction = UISwipeGestureRecognizerDirection.Right
        
        view.addGestureRecognizer(swipeDown)
        view.addGestureRecognizer(swipeUp)
        view.addGestureRecognizer(swipeLeft)
        view.addGestureRecognizer(swipeRight)
    }

    
    func swiped(gesture: UISwipeGestureRecognizer) {
        if gesture.direction == UISwipeGestureRecognizerDirection.Right {
            print("right")
        }
        
        if CGRectContainsPoint(self.one.frame, gesture.locationInView(self.view)) {
            // Play Low E sound
            shakeMoraca()
        }
        print(gesture.direction)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func shakeMoraca() {
        // Create the shake sound
        do {
            if shakePath != nil {
                try shake = AVAudioPlayer(contentsOfURL: NSURL(fileURLWithPath: shakePath!))
                shake.play()
            }
            else {
                print("something else bad happened")
            }
        }
        catch {
            print("something bad happened")
        }
    }
    
    override func motionBegan(motion: UIEventSubtype, withEvent event: UIEvent?) {
        print("shake")
        
        // Create the shake sound
        do {
            if shakePath != nil {
                try shake = AVAudioPlayer(contentsOfURL: NSURL(fileURLWithPath: shakePath!))
                shake.play()
            }
            else {
                print("something else bad happened")
            }
        }
        catch {
            print("something bad happened")
        }
    }


}

