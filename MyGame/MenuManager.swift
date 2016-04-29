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
    var BackToStartScreenLabel = SKLabelNode(fontNamed: "Chalkduster")
    var TestLabel = SKLabelNode(fontNamed: "Chalkduster")
    
    private var main_scene: SKScene
    
    
    init(self_: SKScene) {
        main_scene = self_
        
        // set backgroundColor
        setBackGroundColor(UIColor.blackColor())
    }
    
    func setupFirstStart(){
        setupMainLabel()
        // setupPCLabel()
        setupBTSLabel()
    }
    
    func gameStart(){
        MainLabel.text = ""
        setBackGroundColor(UIColor.whiteColor())
    }
    
    func gameBackToMenu(){
        setBackGroundColor(UIColor.blackColor())
        MainLabel.text = "StickRunner"
        MainLabel.fontColor = UIColor.whiteColor()
        BackToStartScreenLabel.text = ""
    }
    
    func gameOver(){
        MainLabel.fontColor = UIColor.blackColor()
        MainLabel.text = "Game Over"
        BackToStartScreenLabel.text = "Back"
    }
    
    func setTestLabelText(content: String){
        TestLabel.text = content;
    }
    
    func addTestLabel(){
        TestLabel.fontSize = 30
        TestLabel.fontColor = UIColor.redColor()
        TestLabel.position = CGPoint(
            x:(CGRectGetMidX(main_scene.frame) + CGRectGetMidX(main_scene.frame)/2),
            y:(CGRectGetMidY(main_scene.frame) + CGRectGetMidY(main_scene.frame)/2))
        main_scene.addChild(TestLabel)
    }
    
    private func setupMainLabel(){
        MainLabel.text = "StickRunner"
        MainLabel.fontSize = 50
        MainLabel.fontColor = UIColor.whiteColor()
        MainLabel.position = CGPoint(x:CGRectGetMidX(main_scene.frame), y:CGRectGetMidY(main_scene.frame))
        main_scene.addChild(MainLabel)
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