/**
* Copyright (c) 2015-present, Parse, LLC.
* All rights reserved.
*
* This source code is licensed under the BSD-style license found in the
* LICENSE file in the root directory of this source tree. An additional grant
* of patent rights can be found in the PATENTS file in the same directory.
*/

import UIKit
import Parse

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Call to switch to next view controller after 1 seconds
        NSTimer.scheduledTimerWithTimeInterval(1.0, target: self, selector: "goToLoginPage", userInfo: nil, repeats: false)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // This function automatically load the next View Controller
    func goToLoginPage() {
        let nextView:LoginViewController = self.storyboard?.instantiateViewControllerWithIdentifier("loginView") as! LoginViewController
        self.presentViewController(nextView, animated: true, completion: nil)
    }
}
