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
    
    init(type: SQUARE_TYPE = SQUARE_TYPE.default,
         size: CGSize = CGSize(width: SQUARE_SIDE, height: SQUARE_SIDE)){
        
        square_type = type;
        
        // let size_ = size;
        super.init(texture: nil, color: UIColor.black, size: size)
        
        loadPhysicsBodyWithSize(size)
        startMoving()
    }
    
    init(child: Bool,
         type: SQUARE_TYPE = SQUARE_TYPE.default,
         size: CGSize = CGSize(width: SQUARE_SIDE, height: SQUARE_SIDE)) {
        
        square_type = type;
        
        let size_ = CGSize(width: size.width - 8, height: size.height - 8)
        var child_color: UIColor;
        
        switch type {
        case .red:
            child_color = UIColor.red; break;
        case .blue:
            child_color = UIColor.blue; break;
        case .default:
            child_color = UIColor.white; break;
        }
        
        super.init(texture: nil, color: child_color, size: size_)
        
        // do not move the childSquares -> relativity
    }
    
    deinit {
        self.removeAllActions()
        self.removeAllChildren()
        self.removeFromParent()
    }
    
    func loadPhysicsBodyWithSize(_ size: CGSize) {
        physicsBody = SKPhysicsBody(rectangleOf: size)
        
        if(square_type == SQUARE_TYPE.default) {
            physicsBody?.categoryBitMask = SQUARE_CATEGORY
        }
        else if(square_type == SQUARE_TYPE.red) {
            physicsBody?.categoryBitMask = RED_SQUARE_CATEGORY
        }
        else if(square_type == SQUARE_TYPE.blue) {
            physicsBody?.categoryBitMask = BLUE_SQUARE_CATEGORY
        }        
        
        physicsBody?.contactTestBitMask = HERO_CATEGORY
        physicsBody?.affectedByGravity = true
        physicsBody?.isDynamic = true // static objects
        physicsBody?.density = 0.7
    }
    
    func addSmallSquare() {
        let small_square = ObstacleSquare(child: true, type: square_type, size: self.size);
        self.addChild(small_square)
    }
    
    func startMoving() {
        let moveLeft = SKAction.moveBy(x: -SQUARE_SPEED, y: 0, duration: 1)
        run(SKAction.repeatForever(moveLeft))
    }
    
    func stopMoving() {
        removeAllActions()
    }
}
