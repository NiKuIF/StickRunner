//
//  GameViewController.swift
//  MyGame
//
//  Created by Kurt Nistelberger on 24/04/16.
//  Copyright (c) 2016 Kurt Nistelberger. All rights reserved.
//

import UIKit
import SpriteKit

class GameViewController: UIViewController {
    
    // only for debug purposes
    @IBOutlet weak var debug_view: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // setup debug window, true = enable, false = disable
        
        DebugWindow.enable = DEBUG_WINDOW;
        DebugWindow.debug_window = debug_view;
        
        let scene = GameScene(fileNamed: "GameScene")
        
        if (scene != nil) {
            // Configure the view.
            let skView = self.view as! SKView
            
            // for Debuging only
            skView.showsFPS = false
            skView.showsNodeCount = false
            
            /* Sprite Kit applies additional optimizations to improve rendering performance */
            skView.ignoresSiblingOrder = true
            
            /* Set the scale mode to scale to fit the window */
            scene!.scaleMode = .AspectFill
            
            /* Disable Multiple Touches*/
            skView.multipleTouchEnabled = false
            
            skView.presentScene(scene)
        }
        
        // resign active Observer
        NSNotificationCenter.defaultCenter().addObserver(self,
            selector: #selector(GameViewController.obMethResignActive(_:)),
            name: UIApplicationWillResignActiveNotification,
            object: nil)
        
        // did become active Observer
        NSNotificationCenter.defaultCenter().addObserver(self,
            selector: #selector(GameViewController.obMethDidBecomeActive(_:)),
            name: UIApplicationDidBecomeActiveNotification,
            object: nil)
    }
    
    @objc func obMethResignActive(notific: NSNotification) {
        // NSLog("obMethResignActive")
        if( obstacle_handler == nil ||
            gsc.game_state == GAME_STATE.START_SCREEN ||
            gsc.game_state == GAME_STATE.GAME_DEAD){
            return; }
        
        obstacle_handler.pauseGenerating()
    }
    
    @objc func obMethDidBecomeActive(notific: NSNotification) {
        //NSLog("obMethDidBecomeActive")
        if( obstacle_handler == nil ||
            gsc.game_state == GAME_STATE.START_SCREEN ||
            gsc.game_state == GAME_STATE.GAME_DEAD){
            return; }
        
        obstacle_handler.continueSquareGeneration()
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
