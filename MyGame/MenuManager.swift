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
    
    var lb_main = SKLabelNode(fontNamed: "Chalkduster")
    var lb_back = SKLabelNode(fontNamed: "Chalkduster")
    var lb_points = SKLabelNode(fontNamed: "Chalkduster")
    var lb_highscore = SKLabelNode(fontNamed: "Chalkduster")
    
    var lb_restart = SKLabelNode(fontNamed: "Chalkduster")
    
    var lb_test = SKLabelNode(fontNamed: "Chalkduster")
    
    private var main_scene: SKScene
    
    
    init(scene: SKScene) {
        main_scene = scene
        setBackGroundColor(UIColor.blackColor())
    }
    
    func setupFirstStart(){
        setupMainLabel()
        setupHighScoreLabel()
        setupBackLabel()
        setupPointsLabel()
    }
    
    func gameStart(){
        lb_main.text = ""
        lb_points.text = "Points: 0"
        lb_highscore.text = ""
        setBackGroundColor(UIColor.whiteColor())
    }
    
    func gameBackToMenu(){
        setBackGroundColor(UIColor.blackColor())
        lb_main.text = "StickRunner"
        lb_main.fontColor = UIColor.whiteColor()
        lb_back.text = ""
        lb_points.text = ""
    }
    
    func gameOver(){
        lb_main.fontColor = UIColor.blackColor()
        lb_main.text = "Game Over"
        lb_back.text = "Back"
    }
    
    func setHighscoreLabel(highscore: NSInteger){
        lb_highscore.text = "Highscore: \(highscore)"
    }
    
    func updatePointsLabel(points: NSInteger){
        lb_points.text = "Points: \(points)"
    }
    
    func setTestLabelText(content: String){
        lb_test.text = content;
    }
    
    func addTestLabel(){
        lb_test.fontSize = TEST_FONTSIZE
        lb_test.fontColor = UIColor.redColor()
        lb_test.position = CGPoint(
            x:(CGRectGetMidX(main_scene.frame) + CGRectGetMidX(main_scene.frame)/2),
            y:(CGRectGetMidY(main_scene.frame) + CGRectGetMidY(main_scene.frame)/2))
        main_scene.addChild(lb_test)
    }
    
    private func setupMainLabel(){
        lb_main.text = "StickRunner"
        lb_main.fontSize = BIG_FONTSIZE
        lb_main.fontColor = UIColor.whiteColor()
        lb_main.position = CGPoint(
            x:CGRectGetMidX(main_scene.frame),
            y:CGRectGetMidY(main_scene.frame))
        main_scene.addChild(lb_main)
    }
    
    private func setupBackLabel(){
        lb_back.text = ""
        lb_back.fontSize = MIDDLE_FONTSIZE
        lb_back.fontColor = UIColor.blackColor()
        lb_back.position = CGPoint(
            x:(CGRectGetMidX(main_scene.frame) - CGRectGetMidX(main_scene.frame)/2),
            y:(CGRectGetMidY(main_scene.frame) + CGRectGetMidY(main_scene.frame)/2))
        main_scene.addChild(lb_back)
    }
    
    private func setupPointsLabel(){
        lb_points.text = ""
        lb_points.fontSize = SMALL_FONTSIZE
        lb_points.fontColor = UIColor.blackColor()
        lb_points.position = CGPoint(
            x:(CGRectGetMidX(main_scene.frame) + CGRectGetMidX(main_scene.frame)/2),
            y:(CGRectGetMidY(main_scene.frame) + CGRectGetMidY(main_scene.frame)/2))
        main_scene.addChild(lb_points)
    }
    
    private func setupHighScoreLabel(){
        lb_highscore.text = ""
        lb_highscore.fontSize = SMALL_FONTSIZE
        lb_highscore.fontColor = UIColor.whiteColor()
        lb_highscore.position = CGPoint(
            x:(CGRectGetMidX(main_scene.frame) - CGRectGetMidX(main_scene.frame)/2),
            y:(CGRectGetMidY(main_scene.frame) + CGRectGetMidY(main_scene.frame)/2))
        main_scene.addChild(lb_highscore)
    }
    
    private func setBackGroundColor(color: UIColor){
        //backgroundColor = UIColor(red: 159.0/255.0, green: 201.0/255.0, blue: 244.0/255.0, alpha: 1.0)
        main_scene.backgroundColor = color
    }    
}