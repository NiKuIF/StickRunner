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
            scene!.scaleMode = .aspectFill
            
            /* Disable Multiple Touches*/
            skView.isMultipleTouchEnabled = false
            
            skView.presentScene(scene)
        }
        
        // setup debug window, true = enable, false = disable
        DebugWindow.enable = DEBUG_WINDOW;
        DebugWindow.debug_window = debug_view;
        DebugWindow.clearScreen();        
        
        // resign active Observer
        NotificationCenter.default.addObserver(self,
            selector: #selector(GameViewController.obMethResignActive(_:)),
            name: UIApplication.willResignActiveNotification,
            object: nil)
        
        // did become active Observer
        NotificationCenter.default.addObserver(self,
            selector: #selector(GameViewController.obMethDidBecomeActive(_:)),
            name: UIApplication.didBecomeActiveNotification,
            object: nil)
    }
    
    @objc func obMethResignActive(_ notific: Notification) {
        // NSLog("obMethResignActive")
        if( obstacle_handler == nil ||
            gsc.game_state == GAME_STATE.start_SCREEN ||
            gsc.game_state == GAME_STATE.game_DEAD){
            return; }
        
        obstacle_handler.pauseGenerating()
    }
    
    @objc func obMethDidBecomeActive(_ notific: Notification) {
        //NSLog("obMethDidBecomeActive")
        if( obstacle_handler == nil ||
            gsc.game_state == GAME_STATE.start_SCREEN ||
            gsc.game_state == GAME_STATE.game_DEAD){
            return; }
        
        obstacle_handler.continueSquareGeneration()
    }
    
    override var shouldAutorotate : Bool {
        return true
    }

    override var supportedInterfaceOrientations : UIInterfaceOrientationMask {
        if UIDevice.current.userInterfaceIdiom == .phone {
            return .allButUpsideDown
        } else {
            return .all
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Release any cached data, images, etc that aren't in use.
    }

    override var prefersStatusBarHidden : Bool {
        return true
    }
}
