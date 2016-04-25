//
//  GameScene.swift
//  MyGame
//
//  Created by Kurt Nistelberger on 24/04/16.
//  Copyright (c) 2016 Kurt Nistelberger. All rights reserved.
//

import SpriteKit

enum GameState {
    case START_SCREEN
    case GAME_PLAY
    case GAME_DEAD
    case GAME_PAUSE
}

class GameScene: SKScene {
    
    var menu_manager: MenuManager!
    var hero: Hero!
    var obstacle_handler: ObstacleHandler!
 
    var game_state = GameState.START_SCREEN
    
    override func didMoveToView(view: SKView) {
        
        //physicsWorld.gravity = CGVectorMake(0.0, -20)
        
        // create MenuManager and setup First Start
        menu_manager = MenuManager(self_: self)
        menu_manager.setupFirstStart()
        
        // create ObstacleHandler
        obstacle_handler = ObstacleHandler(self_: self)
        
        // create Hero
        hero = Hero(self_: self)
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
       
        if(game_state == GameState.START_SCREEN)
        {
            // clear and set labels
            menu_manager.gameStart()
            
            // show hero
            hero.addToScene()
            hero.startRun()
            
            // draw base line
            obstacle_handler.drawBaseLine()
            
            game_state = GameState.GAME_PLAY
        }
        else if(game_state == GameState.GAME_PLAY)
        {
            if let touch = touches.first {
                let touch_pos :CGPoint = touch.locationInNode(menu_manager.PauseContinueLabel)
                if(touch_pos.x > -50 && touch_pos.y > -4)
                {
                    hero.stopRun()
                    menu_manager.gamePause()
                    game_state = GameState.GAME_PAUSE
                }
                else
                {
                    // jump Action
                    hero.jump()
                }
            }
            
        }
        else if(game_state == GameState.GAME_PAUSE)
        {
            if let touch = touches.first {
                let touch_pos_con :CGPoint = touch.locationInNode(menu_manager.PauseContinueLabel)
                if(touch_pos_con.x > -90 && touch_pos_con.y > -4)
                {
                    hero.startRun()
                    menu_manager.gameContinue()
                    game_state = GameState.GAME_PLAY
                    return;
                }
                
                let touch_pos_back :CGPoint = touch.locationInNode(menu_manager.BackToStartScreenLabel)
                if(touch_pos_back.x < 50 && touch_pos_back.x > -150 && touch_pos_back.y > -4)
                {
                    menu_manager.gameBackToMenu()
                    hero.stopAndRemove()
                    game_state = GameState.START_SCREEN
                }
            }
        }
    }
   
    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
    }
}
