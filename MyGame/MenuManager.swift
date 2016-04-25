//
//  MenuManager.swift
//  MyGame
//
//  Created by Kurt Nistelberger on 24/04/16.
//  Copyright © 2016 Kurt Nistelberger. All rights reserved.
//

import Foundation
import SpriteKit


class MenuManager {
    
    var MainLabel = SKLabelNode(fontNamed: "Chalkduster")
    var PauseContinueLabel = SKLabelNode(fontNamed: "Chalkduster")
    var BackToStartScreenLabel = SKLabelNode(fontNamed: "Chalkduster")
    
    private var main_scene: SKScene
    
    
    init(self_: SKScene) {
        main_scene = self_
        
        // set backgroundColor
        setBackGroundColor(UIColor.blackColor())
    }
    
    func setupFirstStart(){
        setupMainLabel()
        setupPCLabel()
        setupBTSLabel()
    }
    
    func gameStart(){
        MainLabel.text = ""
        PauseContinueLabel.text = "Pause"
        setBackGroundColor(UIColor.whiteColor())
    }
    
    func gamePause(){
        PauseContinueLabel.text = "Continue"
        BackToStartScreenLabel.text = "Back"
    }
    
    func gameContinue(){
        PauseContinueLabel.text = "Pause"
        BackToStartScreenLabel.text = ""
    }
    
    func gameBackToMenu(){
        setBackGroundColor(UIColor.blackColor())
        MainLabel.text = "StickRunner"
        PauseContinueLabel.text = ""
        BackToStartScreenLabel.text = ""
    }
    
    private func setupMainLabel(){
        MainLabel.text = "StickRunner"
        MainLabel.fontSize = 50
        MainLabel.position = CGPoint(x:CGRectGetMidX(main_scene.frame), y:CGRectGetMidY(main_scene.frame))
        main_scene.addChild(MainLabel)
    }
    
    private func setupPCLabel(){
        // no text, that we didn't see it on the StartScreen
        // PauseContinueLabel.text = "Pause"
        PauseContinueLabel.fontSize = 50
        PauseContinueLabel.fontColor = UIColor.blackColor()
        PauseContinueLabel.position = CGPoint(
            x:(CGRectGetMidX(main_scene.frame) + CGRectGetMidX(main_scene.frame)/2),
            y:(CGRectGetMidY(main_scene.frame) + CGRectGetMidY(main_scene.frame)/2))
        main_scene.addChild(PauseContinueLabel)
    }
    
    private func setupBTSLabel(){
        BackToStartScreenLabel.fontSize = 50
        BackToStartScreenLabel.fontColor = UIColor.blackColor()
        BackToStartScreenLabel.position = CGPoint(
            x:(CGRectGetMidX(main_scene.frame) - CGRectGetMidX(main_scene.frame)/2),
            y:(CGRectGetMidY(main_scene.frame) + CGRectGetMidY(main_scene.frame)/2))
        main_scene.addChild(BackToStartScreenLabel)
    }
    
    private func setBackGroundColor(color: UIColor){
        //backgroundColor = UIColor(red: 159.0/255.0, green: 201.0/255.0, blue: 244.0/255.0, alpha: 1.0)
        main_scene.backgroundColor = color
    }
    

    
    
}