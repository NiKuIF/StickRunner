//
//  ObstacleHandler.swift
//  MyGame
//
//  Created by Kurt Nistelberger on 24/04/16.
//  Copyright © 2016 Kurt Nistelberger. All rights reserved.
//

import Foundation
import SpriteKit

class ObstacleHandler {
    
    fileprivate var main_scene: SKScene
    fileprivate var generationTimer: Timer?
    var squares = Array<ObstacleSquare>()
    var squares_tracker = Array<ObstacleSquare>() // to count points
    
    fileprivate var fireing = false;
    
    // for random obstacle generation
    var act_points = 0; // they are always up to date
    fileprivate var timer_divider = 3;
    fileprivate var divider_counter = 0;
    
    
    init(scene: SKScene){
        main_scene = scene;
        startGeneratingWallsEvery()
        drawBaseLine()
    }
    
    fileprivate func startGeneratingWallsEvery() {
        
        // standard false, because we only start the timer once
        fireing = false
        
        generationTimer = Timer.scheduledTimer(timeInterval: OBST_SPEED,
                                        target: self,
                                        selector: #selector(ObstacleHandler.generateSquare),
                                        userInfo: nil,
                                        repeats: true)
    }

    // @objc prefix for Selector usage
    @objc func generateSquare() {
        
        if(!fireing){
            return;
        }
        
        divider_counter += 1;
        if(divider_counter < timer_divider){
            return;
        }
        else{
            divider_counter = 0;
        }
        
        produceObstacle()
    }
    
    
    fileprivate func produceObstacle(){
        
        let squared = ObstacleGenerator.prodSimpleObstacles(act_points)
        
        for square in squared {
            squares.append(square)
            squares_tracker.append(square)
            main_scene.addChild(square)
        }
    
    }
    
    func continueSquareGeneration(){
        fireing = true;
    }
    
    func pauseGeneratingSquares(){
        fireing = false;
        
        for square in squares {
            square.stopMoving()
        }
    }
    
    func pauseGenerating(){
        fireing = false;
    }
    
    func startMoveSquare(){
        for square in squares {
            square.startMoving()
        }
    }
    
    func stopMoveSquare(){
        for square in squares {
            square.stopMoving()
        }
    }
    
    func deleteAllSquares(){
        for square in squares{
            square.removeAllChildren()
            square.removeFromParent()
        }
        squares.removeAll()
        
        /*for square in squares_tracker{
         square.removeFromParent()
         }*/
        squares_tracker.removeAll()
    }
    
    fileprivate func drawBaseLine(){
        let base_line = SKSpriteNode(color: UIColor.black,
                                     size: CGSize(width: main_scene.size.width, height: 4))
        base_line.position = CGPoint(x: main_scene.frame.midX,
                                         y: main_scene.frame.midY -
                                            main_scene.frame.midY/3)
        
        base_line.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: main_scene.size.width, height: 4))
        base_line.physicsBody?.categoryBitMask = BASELINE_CATEGORY
        base_line.physicsBody?.contactTestBitMask = HERO_CATEGORY
        base_line.physicsBody?.isDynamic = false
        
        main_scene.addChild(base_line)
    }
    
 }
