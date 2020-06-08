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
    
    // private members
    fileprivate var TextureAtlas =  SKTextureAtlas()
    fileprivate var TextureArray = [SKTexture]()
    fileprivate var main_scene: SKScene
    
    // variables for jumping, also a double jump is possible
    var jumping = false;
    var jump_count = 0;
    
    // save hero start position, needed for pause and continue
    var start_pos = CGPoint()
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init(scene: SKScene){
        main_scene = scene;
        
        // add texture images
        TextureAtlas = SKTextureAtlas(named: "WinImages")
        for i in 1...TextureAtlas.textureNames.count{
            TextureArray.append(SKTexture(imageNamed: "win_\(i).png"))
        }
        
        let size = CGSize(width: 60, height: 120)
        super.init(texture: TextureArray[0], color: UIColor.clear, size: size)
        
        position = CGPoint(
            x: main_scene.size.width/3 - main_scene.size.width/16,
            y: main_scene.size.height/2 - main_scene.size.height/16 - 28)

        start_pos = position;
        
        loadPhysicsBodyWithSize(size)
    }
    
    func loadPhysicsBodyWithSize(_ size: CGSize) {
        // make physicsBody a bit smaller than the Image
        physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: size.width - 10, height: size.height - 20))
        physicsBody?.categoryBitMask = HERO_CATEGORY
        physicsBody?.contactTestBitMask = SQUARE_CATEGORY
        physicsBody?.contactTestBitMask = BASELINE_CATEGORY
        physicsBody?.affectedByGravity = true
        physicsBody?.isDynamic = true
        // prevent rotation of the hero
        // maybe give that away with new goal, hero should not fall
        physicsBody?.allowsRotation = false
    }
    
    func jumpPhysics(){
        
        if(jumping){ return; }
        
        jump_count += 1
        physicsBody?.applyImpulse(CGVector(dx: 0, dy: 80))
        
        // == 2 for double jump
        if( jump_count == 2){
            jumping = true
        }
        DebugWindow.printJump(jump_count);
    }
    
    func resetJumpVars() {
        jumping = false;
        jump_count = 0;
        DebugWindow.printJump(jump_count);
    }
    
    func addToScene(){
        position = start_pos;
        main_scene.addChild(self)
    }
    
    func removeFromScene(){
        removeFromParent()
    }
    
    func startRun(){
        position = start_pos;
        self.run(SKAction.repeatForever(
            SKAction.animate(with: TextureArray, timePerFrame: 0.1)))
    }
    
    func continueRun(){
        self.run(SKAction.repeatForever(
            SKAction.animate(with: TextureArray, timePerFrame: 0.1)))
    }
    
    func stopRun(){
        self.removeAllActions()
    }
}
