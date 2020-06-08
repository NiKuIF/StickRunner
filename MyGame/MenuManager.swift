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
    
    fileprivate var main_scene: SKScene
    
    
    init(scene: SKScene) {
        main_scene = scene
        setBackGroundColor(UIColor.black)
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
        setBackGroundColor(UIColor.white)
    }
    
    func gameBackToMenu(){
        setBackGroundColor(UIColor.black)
        lb_main.text = "StickRunner"
        lb_main.fontColor = UIColor.white
        lb_back.text = ""
        lb_points.text = ""
    }
    
    func gameOver(){
        lb_main.fontColor = UIColor.black
        lb_main.text = "Game Over"
        lb_back.text = "Back"
    }
    
    func setHighscoreLabel(_ highscore: NSInteger){
        lb_highscore.text = "Highscore: \(highscore)"
    }
    
    func updatePointsLabel(_ points: NSInteger){
        lb_points.text = "Points: \(points)"
    }
    
    func setTestLabelText(_ content: String){
        lb_test.text = content;
    }
    
    func addTestLabel(){
        lb_test.fontSize = TEST_FONTSIZE
        lb_test.fontColor = UIColor.red
        lb_test.position = CGPoint(
            x:(main_scene.frame.midX + main_scene.frame.midX/2),
            y:(main_scene.frame.midY + main_scene.frame.midY/2))
        main_scene.addChild(lb_test)
    }
    
    fileprivate func setupMainLabel(){
        lb_main.text = "StickRunner"
        lb_main.fontSize = BIG_FONTSIZE
        lb_main.fontColor = UIColor.white
        lb_main.position = CGPoint(
            x:main_scene.frame.midX,
            y:main_scene.frame.midY)
        main_scene.addChild(lb_main)
    }
    
    fileprivate func setupBackLabel(){
        lb_back.text = ""
        lb_back.fontSize = MIDDLE_FONTSIZE
        lb_back.fontColor = UIColor.black
        lb_back.position = CGPoint(
            x:(main_scene.frame.midX - main_scene.frame.midX/2),
            y:(main_scene.frame.midY + main_scene.frame.midY/2))
        main_scene.addChild(lb_back)
    }
    
    fileprivate func setupPointsLabel(){
        lb_points.text = ""
        lb_points.fontSize = SMALL_FONTSIZE
        lb_points.fontColor = UIColor.black
        lb_points.position = CGPoint(
            x:(main_scene.frame.midX + main_scene.frame.midX/2),
            y:(main_scene.frame.midY + main_scene.frame.midY/2))
        main_scene.addChild(lb_points)
    }
    
    fileprivate func setupHighScoreLabel(){
        lb_highscore.text = ""
        lb_highscore.fontSize = SMALL_FONTSIZE
        lb_highscore.fontColor = UIColor.white
        lb_highscore.position = CGPoint(
            x:(main_scene.frame.midX - main_scene.frame.midX/2),
            y:(main_scene.frame.midY + main_scene.frame.midY/2))
        main_scene.addChild(lb_highscore)
    }
    
    fileprivate func setBackGroundColor(_ color: UIColor){
        //backgroundColor = UIColor(red: 159.0/255.0, green: 201.0/255.0, blue: 244.0/255.0, alpha: 1.0)
        main_scene.backgroundColor = color
    }    
}
