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
        // do not move the childSquares -> relativily
    }
    
    deinit {
        // NSLog("deinit called!!!\n")
        self.removeAllChildren()
        self.removeFromParent()
        self.removeAllActions()
    }
    
    func loadPhysicsBodyWithSize(size: CGSize) {
        physicsBody = SKPhysicsBody(rectangleOfSize: size)
        physicsBody?.categoryBitMask = wallCategory
        physicsBody?.affectedByGravity = false
    }
    
    func addSmallSquare() {
        let small_square = ObstacleSquare(child: true);
        self.addChild(small_square)
    }
    
    func startMoving() {
        let moveLeft = SKAction.moveByX(-150, y: 0, duration: 1)
        runAction(SKAction.repeatActionForever(moveLeft))
    }
    
    func stopMoving() {
        removeAllActions()
    }
    
}
