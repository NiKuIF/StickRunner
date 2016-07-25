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
    
    var square_type: SQUARE_TYPE;
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init(type: SQUARE_TYPE = SQUARE_TYPE.DEFAULT,
         size: CGSize = CGSizeMake(SQUARE_SIDE, SQUARE_SIDE)){
        
        square_type = type;
        
        // let size_ = size;
        super.init(texture: nil, color: UIColor.blackColor(), size: size)
        
        loadPhysicsBodyWithSize(size)
        startMoving()
    }
    
    init(child: Bool,
         type: SQUARE_TYPE = SQUARE_TYPE.DEFAULT,
         size: CGSize = CGSizeMake(SQUARE_SIDE, SQUARE_SIDE)) {
        
        square_type = type;
        
        let size_ = CGSizeMake(size.width - 8, size.height - 8)
        var child_color: UIColor;
        
        switch type {
        case .RED:
            child_color = UIColor.redColor(); break;
        case .BLUE:
            child_color = UIColor.blueColor(); break;
        case .DEFAULT:
            child_color = UIColor.whiteColor(); break;
        }
        
        super.init(texture: nil, color: child_color, size: size_)
        
        // do not move the childSquares -> relativity
    }
    
    deinit {
        self.removeAllActions()
        self.removeAllChildren()
        self.removeFromParent()
    }
    
    func loadPhysicsBodyWithSize(size: CGSize) {
        physicsBody = SKPhysicsBody(rectangleOfSize: size)
        
        if(square_type == SQUARE_TYPE.DEFAULT) {
            physicsBody?.categoryBitMask = SQUARE_CATEGORY
        }
        else if(square_type == SQUARE_TYPE.RED) {
            physicsBody?.categoryBitMask = RED_SQUARE_CATEGORY
        }
        else if(square_type == SQUARE_TYPE.BLUE) {
            physicsBody?.categoryBitMask = BLUE_SQUARE_CATEGORY
        }        
        
        physicsBody?.contactTestBitMask = HERO_CATEGORY
        physicsBody?.affectedByGravity = false
        physicsBody?.dynamic = false // static objects
    }
    
    func addSmallSquare() {
        let small_square = ObstacleSquare(child: true, type: square_type, size: self.size);
        self.addChild(small_square)
    }
    
    func startMoving() {
        let moveLeft = SKAction.moveByX(-SQUARE_SPEED, y: 0, duration: 1)
        runAction(SKAction.repeatActionForever(moveLeft))
    }
    
    func stopMoving() {
        removeAllActions()
    }
}
