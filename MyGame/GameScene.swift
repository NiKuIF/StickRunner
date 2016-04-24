//
//  GameScene.swift
//  MyGame
//
//  Created by Kurt Nistelberger on 24/04/16.
//  Copyright (c) 2016 Kurt Nistelberger. All rights reserved.
//

import SpriteKit

class GameScene: SKScene {
    
    var MainGuy = SKSpriteNode() // the actual dancing man ;)
    
    var MainLabel = SKLabelNode(fontNamed: "Chalkduster")
    var PauseContinueLabel = SKLabelNode(fontNamed: "Chalkduster")
    var BackToStartScreenLabel = SKLabelNode(fontNamed: "Chalkduster")
    
    var TextureAtlas =  SKTextureAtlas()
    var TextureArray = [SKTexture]()
    
    enum GameState {
        case START_SCREEN
        case GAME_PLAY
        case GAME_DEAD
        case GAME_PAUSE
    }
    var game_state = GameState.START_SCREEN
    
    override func didMoveToView(view: SKView) {
        /* Setup your scene here */
        
        //backgroundColor = UIColor(red: 159.0/255.0, green: 201.0/255.0, blue: 244.0/255.0, alpha: 1.0)
        backgroundColor = UIColor.blackColor()
        
        // setup MainLabel
        MainLabel.text = "StickRunner"
        MainLabel.fontSize = 50
        MainLabel.position = CGPoint(x:CGRectGetMidX(self.frame), y:CGRectGetMidY(self.frame))
        self.addChild(MainLabel)
        
        // setup PauseContinue Label
        PauseContinueLabel.fontSize = 50
        PauseContinueLabel.fontColor = UIColor.blackColor()
        PauseContinueLabel.position = CGPoint(x:(CGRectGetMidX(self.frame) + CGRectGetMidX(self.frame)/2), y:(CGRectGetMidY(self.frame) + CGRectGetMidY(self.frame)/2))
        self.addChild(PauseContinueLabel)
        
        // setip BackToStartScreenLabel
        BackToStartScreenLabel.fontSize = 50
        BackToStartScreenLabel.fontColor = UIColor.blackColor()
        BackToStartScreenLabel.position = CGPoint(x:(CGRectGetMidX(self.frame) - CGRectGetMidX(self.frame)/2), y:(CGRectGetMidY(self.frame) + CGRectGetMidY(self.frame)/2))
        self.addChild(BackToStartScreenLabel)
        
        TextureAtlas = SKTextureAtlas(named: "WinImages")
        for i in 1...TextureAtlas.textureNames.count{
            var Name = "win_\(i).png"
            TextureArray.append(SKTexture(imageNamed: Name))
        }
        
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
       
        if(game_state == GameState.START_SCREEN)
        {
            // clear label
            MainLabel.text = ""
            PauseContinueLabel.text = "Pause"
            
            // set new background color
            backgroundColor = UIColor.whiteColor()
            
            // create MainGuy
            MainGuy = SKSpriteNode(imageNamed: TextureAtlas.textureNames[0])
            MainGuy.size = CGSize(width: 70, height: 140)
            MainGuy.position = CGPoint(x: self.size.width/2, y: self.size.height/2)
            self.addChild(MainGuy) // add to scene
            
            // draw base line
            var base_line = SKSpriteNode(color: UIColor.blackColor(), size: CGSizeMake(self.size.width, 4))
            base_line.position = CGPointMake(CGRectGetMidX(self.frame), CGRectGetMidY(self.frame) - CGRectGetMidY(self.frame)/3)
            addChild(base_line)
                
            // let the man run
            MainGuy.runAction(SKAction.repeatActionForever(SKAction.animateWithTextures(TextureArray, timePerFrame: 0.1)))
            
            game_state = GameState.GAME_PLAY
        }
        else if(game_state == GameState.GAME_PLAY)
        {
            if let touch = touches.first {
                let touch_pos :CGPoint = touch.locationInNode(PauseContinueLabel)
                if(touch_pos.x > -50 && touch_pos.y > -4)
                {
                    MainGuy.removeAllActions()
                    PauseContinueLabel.text = "Continue"
                    BackToStartScreenLabel.text = "Back"
                    game_state = GameState.GAME_PAUSE
                }
            }
        }
        else if(game_state == GameState.GAME_PAUSE)
        {
            if let touch = touches.first {
                let touch_pos_con :CGPoint = touch.locationInNode(PauseContinueLabel)
                if(touch_pos_con.x > -90 && touch_pos_con.y > -4)
                {
                    MainGuy.runAction(SKAction.repeatActionForever(SKAction.animateWithTextures(TextureArray, timePerFrame: 0.1)))
                    PauseContinueLabel.text = "Pause"
                    BackToStartScreenLabel.text = ""
                    game_state = GameState.GAME_PLAY
                    return;
                }
                
                let touch_pos_back :CGPoint = touch.locationInNode(BackToStartScreenLabel)
                if(touch_pos_back.x < 50 && touch_pos_back.x > -150 && touch_pos_back.y > -4)
                {
                    MainLabel.text = "StickRunner"
                    backgroundColor = UIColor.blackColor()
                    
                    PauseContinueLabel.text = ""
                    BackToStartScreenLabel.text = ""
                    
                    MainGuy.removeFromParent()
                    
                    game_state = GameState.START_SCREEN
                }
            }
        }
    }
   
    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
    }
}
