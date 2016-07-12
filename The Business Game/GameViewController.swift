//
//  GameViewController.swift
//  Mio
//
//  Created by Gonzalo Caballero on 6/27/16.
//  Copyright (c) 2016 Gonzalo Caballero. All rights reserved.
//

import UIKit
import SpriteKit

let registerSavedValue = NSUserDefaults.standardUserDefaults()
var register = true

class GameViewController: UIViewController {
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        //let register = registerSavedValue.boolForKey("register")
        
        if register  {
            print("ss")
            print(register)
            let vc = storyboard?.instantiateViewControllerWithIdentifier("Login") as! UINavigationController
            presentViewController(vc, animated: true, completion: nil)
            
            if let scene = GameScene1(fileNamed:"GameScene1") {
                // Configure the view.
                let skView = self.view as! SKView
                skView.showsFPS = true
                skView.showsNodeCount = true
                
                /* Sprite Kit applies additional optimizations to improve rendering performance */
                skView.ignoresSiblingOrder = true
                
                /* Set the scale mode to scale to fit the window */
                scene.scaleMode = .AspectFill
                
                skView.presentScene(scene)
            }
        }else {
            
            if let scene = GameScene1(fileNamed:"GameScene1") {
                // Configure the view.
                let skView = self.view as! SKView
                skView.showsFPS = true
                skView.showsNodeCount = true
                
                /* Sprite Kit applies additional optimizations to improve rendering performance */
                skView.ignoresSiblingOrder = true
                
                /* Set the scale mode to scale to fit the window */
                scene.scaleMode = .AspectFill
                
                skView.presentScene(scene)
                
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    override func shouldAutorotate() -> Bool {
        return true
    }
    
    override func supportedInterfaceOrientations() -> UIInterfaceOrientationMask {
        if UIDevice.currentDevice().userInterfaceIdiom == .Phone {
            return .AllButUpsideDown
        } else {
            return .All
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Release any cached data, images, etc that aren't in use.
    }
    
    override func prefersStatusBarHidden() -> Bool {
        return true
    }
}
