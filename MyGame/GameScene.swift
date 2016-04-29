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

// SKPhysicsContactDelegate 
// for physics action, like collision detection
class GameScene: SKScene, SKPhysicsContactDelegate {
    
    var menu_manager: MenuManager!
    var hero: Hero!
    var obstacle_handler: ObstacleHandler!
 
    var game_state = GameState.START_SCREEN
    
    override func didMoveToView(view: SKView) {
        
        // add physics world
        physicsWorld.contactDelegate = self
        
        // create MenuManager and setup First Start
        menu_manager = MenuManager(self_: self)
        menu_manager.setupFirstStart()
        
        // create ObstacleHandler
        obstacle_handler = ObstacleHandler(self_: self)
        
        // create Hero
        hero = Hero(self_: self)
        
        obstacle_handler.startGeneratingWallsEvery(2)
        
        menu_manager.addTestLabel()
        
        menu_manager.setTestLabelText("points: 0")
        
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
       
        if(game_state == GameState.START_SCREEN){
            startGame()
        }
        else if(game_state == GameState.GAME_PLAY){
            hero.jump()
        }
        else if( game_state == GameState.GAME_DEAD){
            restartGame(touches)
        }
    }
   
    var point_counter = 0
    
    override func update(currentTime: CFTimeInterval) {
        
        // update to count points
      
        if obstacle_handler.squares_tracker.count > 0 {
            
            let wall = obstacle_handler.squares_tracker[0] as ObstacleSquare
            
            let wallLocation = wall.convertPoint(wall.position, toNode: self)
        
            if wallLocation.x < hero.position.x {
                obstacle_handler.squares_tracker.removeAtIndex(0)
                
                /*let pointsLabel = childNodeWithName("pointsLabel") as! MLPointsLabel
                pointsLabel.increment()
                */
                
                point_counter += 1
                
                menu_manager.setTestLabelText("points: \(point_counter)")
                
            }
        }
        
        
        // for testing print squares, memory leak
        // obstacle_handler.squares.count
        
        //menu_manager.setTestLabelText("square: \(obstacle_handler.squares.count)")
    }
    
    // SKPhysicsContactDelegate - fires when hero runs against square
    func didBeginContact(contact: SKPhysicsContact) {
        // game over
        
        // add hero fall animation
        
        hero.jumping = false;
        hero.stopRun()
        obstacle_handler.stopGeneratingSquares()
        menu_manager.gameOver()
        
        game_state = GameState.GAME_DEAD
    }
    
    func startGame(){
        
        point_counter = 0
        menu_manager.setTestLabelText("points: \(0)")
        
        // clear and set labels
        menu_manager.gameStart()
        
        // show hero
        hero.addToScene()
        hero.startRun()
        
        // draw base line
        obstacle_handler.drawBaseLine()
        
        // start wall generation
        obstacle_handler.continueSquareGeneration()
        
        game_state = GameState.GAME_PLAY
    }
    
    func restartGame(touches: Set<UITouch>){
        if let touch = touches.first {
            let touch_pos_back :CGPoint = touch.locationInNode(menu_manager.BackToStartScreenLabel)
            if(touch_pos_back.x < 50 && touch_pos_back.x > -150 && touch_pos_back.y > -4)
            {
                menu_manager.gameBackToMenu()
                hero.stopAndRemove()
                obstacle_handler.removeAllSquares()
                obstacle_handler.deleteSquares()
                game_state = GameState.START_SCREEN
            }
        }
    }
}
