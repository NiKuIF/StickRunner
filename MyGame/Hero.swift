//
//  Hero.swift
//  MyGame
//
//  Created by Kurt Nistelberger on 24/04/16.
//  Copyright © 2016 Kurt Nistelberger. All rights reserved.
//

import Foundation
import SpriteKit


class Hero: SKSpriteNode {
    
    
    let heroCategory: UInt32 = 0x1 << 0
    let wallCategory: UInt32 = 0x1 << 1
    
    var TextureAtlas =  SKTextureAtlas()
    var TextureArray = [SKTexture]()
    
    var main_scene: SKScene
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init(self_: SKScene){
        main_scene = self_;
        
        TextureAtlas = SKTextureAtlas(named: "WinImages")
        for i in 1...TextureAtlas.textureNames.count{
            TextureArray.append(SKTexture(imageNamed: "win_\(i).png"))
        }
        
        let size = CGSizeMake(70, 140)
        super.init(texture: TextureArray[0], color: UIColor.clearColor(), size: size)
        
        position = CGPoint(
            x: main_scene.size.width/3,
            y: main_scene.size.height/2 - main_scene.size.height/16)
        
        physicsBody = SKPhysicsBody(rectangleOfSize: size)
        //physicsBody?.categoryBitMask = heroCategory
        //physicsBody?.contactTestBitMask = wallCategory
        physicsBody = SKPhysicsBody(circleOfRadius: self.size.height / 2.75)
        physicsBody?.affectedByGravity = false
        
    }
    
    func addToScene(){
        main_scene.addChild(self)
    }
    
    func startRun(){
        self.runAction(SKAction.repeatActionForever(
            SKAction.animateWithTextures(TextureArray, timePerFrame: 0.1)))
    }
    
    func stopRun(){
        self.removeAllActions()
    }
    
    func stopAndRemove(){
        stopRun()
        removeFromParent()
    }
    
    func jump(){
       
        // NSLog("height:\(size.height)")
        // let cache_pos = position
        
        //let jumpup = SKAction.moveToY(position.y + 30, duration: 0.5)
        //let jumpdown = SKAction.moveToY(position.y - 30, duration: 0.5)
        
        
        
        //physicsBody?.applyImpulse(CGVectorMake(0, 1))
        
        //physicsBody?.affectedByGravity = true
        //physicsBody?.applyImpulse(CGVectorMake(0, 1), atPoint: position)
        
        
        //let rotateBack = SKAction.rotateByAngle(CGFloat(M_PI) / 2, duration: 0.4)
        //runAction(rotateBack)
        
        //runAction(jumpup)
        //runAction(jumpdown)
        
        
        physicsBody?.dynamic = true
        physicsBody?.velocity = CGVectorMake(0, 0)
        physicsBody?.applyImpulse(CGVectorMake(0, 20))
        
        
    }
}




