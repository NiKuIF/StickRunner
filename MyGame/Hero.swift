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
    private var TextureAtlas =  SKTextureAtlas()
    private var TextureArray = [SKTexture]()
    private var main_scene: SKScene
    
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
        
        let size = CGSizeMake(60, 120)
        super.init(texture: TextureArray[0], color: UIColor.clearColor(), size: size)
        
        position = CGPoint(
            x: main_scene.size.width/3 - main_scene.size.width/16,
            y: main_scene.size.height/2 - main_scene.size.height/16 - 28)

        start_pos = position;
        
        loadPhysicsBodyWithSize(size)
    }
    
    func loadPhysicsBodyWithSize(size: CGSize) {
        // make physicsBody a bit smaller than the Image
        physicsBody = SKPhysicsBody(rectangleOfSize: CGSizeMake(size.width - 10, size.height - 20))
        physicsBody?.categoryBitMask = HERO_CATEGORY
        physicsBody?.contactTestBitMask = SQUARE_CATEGORY
        physicsBody?.contactTestBitMask = BASELINE_CATEGORY
        physicsBody?.affectedByGravity = true
        physicsBody?.dynamic = true
        // prevent rotation of the hero
        // maybe give that away with new goal, hero should not fall
        physicsBody?.allowsRotation = false
    }
    
    func jumpPhysics(){
        
        if(jumping){
            if(!checkIfResetJumpVars()){
                return;
            }
        } else {
            checkIfResetJumpVars()
        }
        
        jump_count += 1
        physicsBody?.applyImpulse(CGVectorMake(0, 80))
        
        if( jump_count == 2){
            jumping = true
        }
    }
    
    private func checkIfResetJumpVars()->Bool{
        // check if hero is back on the baseline
        // todo: not hardcoded 308.757
        if(self.position.y < 315 && self.position.y > 300){
            //NSLog("back to baseline")
            jumping = false
            jump_count = 0
            return true;
        }
        return false;
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
        self.runAction(SKAction.repeatActionForever(
            SKAction.animateWithTextures(TextureArray, timePerFrame: 0.1)))
    }
    
    func continueRun(){
        self.runAction(SKAction.repeatActionForever(
            SKAction.animateWithTextures(TextureArray, timePerFrame: 0.1)))
    }
    
    func stopRun(){
        self.removeAllActions()
    }
}
