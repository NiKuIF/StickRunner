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
    
    private var baseline_thickness: CGFloat
    
    init(self_: SKScene){
        main_scene = self_;
        baseline_thickness = 4;
    }
    
    func drawBaseLine(){
        let base_line = SKSpriteNode(color: UIColor.blackColor(),
                                     size: CGSizeMake(main_scene.size.width, baseline_thickness))
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
        
        let square = ObstacleSquare()
        square.position.x = main_scene.size.width
        square.position.y = main_scene.size.height/2 -
                            main_scene.size.height/8 -
                            square.size.height/2
        square.addSmallSquare()
        squares.append(square)
        main_scene.addChild(square)

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