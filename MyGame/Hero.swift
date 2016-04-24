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
            y: main_scene.size.height/2)
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
    
}