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
    
    var main_scene: SKScene
    
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
    
    func createObstacles(){
        
    }
    
}