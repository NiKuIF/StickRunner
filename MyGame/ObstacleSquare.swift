//
//  ObstacleSquare.swift
//  MyGame
//
//  Created by Kurt Nistelberger on 26/04/16.
//  Copyright © 2016 Kurt Nistelberger. All rights reserved.
//

import Foundation
import SpriteKit

class ObstacleSquare: SKSpriteNode {
    
    let SQUARE_SIDE: CGFloat = 30.0
    let SQUARE_COLOR = UIColor.blackColor()
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init() {
        let size = CGSizeMake(SQUARE_SIDE, SQUARE_SIDE)
        super.init(texture: nil, color: SQUARE_COLOR, size: size)
        
        loadPhysicsBodyWithSize(size)
        startMoving()
    }
    
    func loadPhysicsBodyWithSize(size: CGSize) {
        physicsBody = SKPhysicsBody(rectangleOfSize: size)
        physicsBody?.categoryBitMask = wallCategory
        physicsBody?.affectedByGravity = false
    }
    
    func startMoving() {
        let moveLeft = SKAction.moveByX(-150, y: 0, duration: 1)
        runAction(SKAction.repeatActionForever(moveLeft))
    }
    
    func stopMoving() {
        removeAllActions()
    }
    
}
