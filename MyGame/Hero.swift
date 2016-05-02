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
    // private var main_scene: SKScene
    
    // variables for jumping, also a double jump is possible
    var jumping = false;
    var jump_count = 0;
    
    // save hero start position, needed for pause and continue
    var start_pos = CGPoint()
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init(){
        // add texture images
        TextureAtlas = SKTextureAtlas(named: "WinImages")
        for i in 1...TextureAtlas.textureNames.count{
            TextureArray.append(SKTexture(imageNamed: "win_\(i).png"))
        }
        
        let size = CGSizeMake(60, 120)
        super.init(texture: TextureArray[0], color: UIColor.clearColor(), size: size)
        
        /* position = CGPoint(
            x: main_scene.size.width/3 - main_scene.size.width/16,
            y: main_scene.size.height/2 - main_scene.size.height/16 - 28)
        */
        
        // start_pos = position;
        
        loadPhysicsBodyWithSize(size)
    }
    
    init(scene: SKScene){
        //main_scene = scene;
        
        // add texture images
        TextureAtlas = SKTextureAtlas(named: "WinImages")
        for i in 1...TextureAtlas.textureNames.count{
            TextureArray.append(SKTexture(imageNamed: "win_\(i).png"))
        }
        
        let size = CGSizeMake(60, 120)
        super.init(texture: TextureArray[0], color: UIColor.clearColor(), size: size)
        
       /* position = CGPoint(
            x: main_scene.size.width/3 - main_scene.size.width/16,
            y: main_scene.size.height/2 - main_scene.size.height/16 - 28)
        */
        
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
    }
    
    func jumpSequence(){
        
        if(jumping){
            return;
        }
        
        let jumpUpAction = SKAction.moveByX(0, y:70, duration:0.5)
        let jumpDownAction = SKAction.moveByX(0, y:-70, duration:0.5)
        let jumpSequence = SKAction.sequence([jumpUpAction, jumpDownAction])
        
        jump_count += 1
        jumping = true
        self.runAction(jumpSequence, completion: { self.jumping = false })
    }
    
    private func jump_check(){
        
        if( jump_count == 2){
            jumping = true
            jump_count = 0
        }
        else{
            jumping = false
        }
    }
    
    func jumpPhysics(){
       // player.physicsBody!.applyForce(CGVectorMake(0, 400))
        physicsBody?.applyImpulse(CGVectorMake(0, 80))
    }
    
    func addToScene(){
        position = start_pos;
       // main_scene.addChild(self)
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
