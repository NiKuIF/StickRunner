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
    var squares = [ObstacleSquare]()
    
    init(self_: SKScene){
        main_scene = self_;
    }
    
    func drawBaseLine(){
        let base_line = SKSpriteNode(color: UIColor.blackColor(),
                                     size: CGSizeMake(main_scene.size.width, 4))
        base_line.position = CGPointMake(CGRectGetMidX(main_scene.frame),
                                         CGRectGetMidY(main_scene.frame) -
                                            CGRectGetMidY(main_scene.frame)/3)
        main_scene.addChild(base_line)
    }
    
    func startGeneratingWallsEvery(seconds: NSTimeInterval) {
        generationTimer = NSTimer.scheduledTimerWithTimeInterval(seconds, target: self, selector: #selector(ObstacleHandler.generateSquare), userInfo: nil, repeats: true)
    }
    
    // @objc prefix for Selector usage
    @objc func generateSquare() {
        
        NSLog("generate Square")
        
        let wall = ObstacleSquare()
        wall.position.x = main_scene.size.width
        wall.position.y = main_scene.size.height/2 - main_scene.size.height/8
        squares.append(wall)
        main_scene.addChild(wall)

        /*
         x: main_scene.size.width/3,
         y: main_scene.size.height/2 - main_scene.size.height/16)
         */
        
    }
    
    func stopGeneratingSquares(){
        generationTimer?.invalidate()

        for square in squares {
            square.stopMoving()
        }
    }
    
}