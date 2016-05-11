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
    
    private var main_scene: SKScene
    private var generationTimer: NSTimer?
    var squares = Array<ObstacleSquare>()
    var squares_tracker = Array<ObstacleSquare>() // to count points
    
    private var fireing = false;
    
    // for random obstacle generation
    var act_points = 0;
    private var timer_divider = 2;
    private var divider_counter = 0;
    
    
    init(scene: SKScene, seconds: NSTimeInterval){
        main_scene = scene;
        startGeneratingWallsEvery(seconds)
        drawBaseLine()
    }
    
    private func startGeneratingWallsEvery(seconds: NSTimeInterval) {
        
        // standard false, because we only start the timer once
        fireing = false
        
        generationTimer = NSTimer.scheduledTimerWithTimeInterval(seconds,
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
    
    private func produceObstacle(){
        
        let squared = ObstacleGenerator.prodSimpleObstacles()
        
        
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
    
    private func drawBaseLine(){
        let base_line = SKSpriteNode(color: UIColor.blackColor(),
                                     size: CGSizeMake(main_scene.size.width, 4))
        base_line.position = CGPointMake(CGRectGetMidX(main_scene.frame),
                                         CGRectGetMidY(main_scene.frame) -
                                            CGRectGetMidY(main_scene.frame)/3)
        
        base_line.physicsBody = SKPhysicsBody(rectangleOfSize: CGSizeMake(main_scene.size.width, 4))
        base_line.physicsBody?.categoryBitMask = BASELINE_CATEGORY
        base_line.physicsBody?.contactTestBitMask = HERO_CATEGORY
        base_line.physicsBody?.dynamic = false
        
        main_scene.addChild(base_line)
    }
    
 }