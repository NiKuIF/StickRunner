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
    
    init(){
        let size_ = CGSizeMake(SQUARE_SIDE, SQUARE_SIDE)
        super.init(texture: nil, color: SQUARE_COLOR, size: size_)
        
        loadPhysicsBodyWithSize(size)
        startMoving()
    }
    
    init(child: Bool) {
        let size_ = CGSizeMake(SQUARE_SIDE - 8, SQUARE_SIDE - 8)
        super.init(texture: nil, color: UIColor.whiteColor(), size: size_)
        // do not move the childSquares -> relativity
    }
    
    deinit {
        // NSLog("deinit called!!!\n")
        self.removeAllActions()
        self.removeAllChildren()
        self.removeFromParent()
    }
    
    func loadPhysicsBodyWithSize(size: CGSize) {
        physicsBody = SKPhysicsBody(rectangleOfSize: size)
        physicsBody?.categoryBitMask = SQUARE_CATEGORY
        physicsBody?.contactTestBitMask = HERO_CATEGORY
        physicsBody?.affectedByGravity = false
    }
    
    func addSmallSquare() {
        let small_square = ObstacleSquare(child: true);
        self.addChild(small_square)
    }
    
    func startMoving() {
        let moveLeft = SKAction.moveByX(-200, y: 0, duration: 1)
        runAction(SKAction.repeatActionForever(moveLeft))
    }
    
    func stopMoving() {
        removeAllActions()
    }
    
}
