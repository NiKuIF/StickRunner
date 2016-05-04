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
}

var obstacle_handler: ObstacleHandler!
var game_state = GameState.START_SCREEN

// SKPhysicsContactDelegate
// for physics action, like collision detection
class GameScene: SKScene, SKPhysicsContactDelegate {
    
    var menu_manager: MenuManager!
    var hero: Hero!
    // var obstacle_handler: ObstacleHandler!
    
    var point_counter = 0
    // var game_state = GameState.START_SCREEN
    
    var highscore = 0
    
    override func didMoveToView(view: SKView) {
        
        // add physics world, for collision detection
        physicsWorld.contactDelegate = self
        physicsWorld.gravity = CGVectorMake(0.0, -5.0)
        
        // create MenuManager and setup First Start
        menu_manager = MenuManager(scene: self)
        menu_manager.setupFirstStart()
        
        // load highscore
        highscore = HighscoreSave.getHighscore()
        menu_manager.setHighscoreLabel(highscore)
        
        // create ObstacleHandler
        obstacle_handler = ObstacleHandler(scene: self, seconds: 2)
        
        // create Hero
        hero = Hero(scene: self)
    }
    
    // fired every screen touch
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
       
        if(game_state == GameState.START_SCREEN){
            startGame()
        }
        else if(game_state == GameState.GAME_PLAY){
            hero.jumpPhysics()
        }
        else if( game_state == GameState.GAME_DEAD){
            backToMenu(touches)
        }
    }
   
    override func update(currentTime: CFTimeInterval) {
        
        // update to count points
        if obstacle_handler.squares_tracker.count > 0 {
            
            let square = obstacle_handler.squares_tracker[0] as ObstacleSquare
            let square_pos = square.convertPoint(square.position, toNode: self)
            
            if square_pos.x < hero.position.x + 10 {
                obstacle_handler.squares_tracker.removeAtIndex(0)
                point_counter += 1
                menu_manager.updatePointsLabel(point_counter)
            }
        }
    }
    
    // SKPhysicsContactDelegate - fires when hero runs against square
    func didBeginContact(contact: SKPhysicsContact) {

        var first_body, second_body: SKPhysicsBody
        
        if(contact.bodyA.categoryBitMask < contact.bodyB.categoryBitMask){
            first_body = contact.bodyA
            second_body = contact.bodyB
        } else {
            first_body = contact.bodyB
            second_body = contact.bodyA
        }
        
        if((first_body.categoryBitMask & HERO_CATEGORY) != 0 &&
            (second_body.categoryBitMask & SQUARE_CATEGORY) != 0){
            // NSLog("SQUARE\n")
            
            // Game Over Action
            // add hero fall animation
            hero.jumping = false;
            hero.stopRun()
            obstacle_handler.pauseGeneratingSquares()
            menu_manager.gameOver()
            
            game_state = GameState.GAME_DEAD
            return;
        }
        
        if((first_body.categoryBitMask & HERO_CATEGORY) != 0 &&
            (second_body.categoryBitMask & BASELINE_CATEGORY) != 0){
            // NSLog("BASELINE\n")
            // nothing happend, just that he didn't fall to nirvana
        }
        
        // check for new Highscore, if then save
        if(point_counter > highscore){
            highscore = point_counter
            HighscoreSave.saveHighscore(highscore)
        }
    }
    
    func startGame(){
        
        // clear and set labels
        point_counter = 0
        menu_manager.gameStart()
        
        // show hero
        hero.addToScene()
        hero.startRun()
        
        // start wall generation
        obstacle_handler.continueSquareGeneration()
        
        game_state = GameState.GAME_PLAY
    }
    
    func backToMenu(touches: Set<UITouch>){
        if let touch = touches.first {
            let touch_pos_back :CGPoint = touch.locationInNode(menu_manager.lb_back)
            if(touch_pos_back.x < 50 &&
               touch_pos_back.x > -150 &&
               touch_pos_back.y > -4)
            {
                menu_manager.gameBackToMenu()
                menu_manager.setHighscoreLabel(highscore)
                hero.removeFromScene()
                obstacle_handler.deleteAllSquares()
                game_state = GameState.START_SCREEN
            }
        }
    }
    
    
    func stopTimer(){
        obstacle_handler.pauseGeneratingSquares()
    }
    
    static func getInstance() -> GameScene.Type{
        return self;
    }
    
}
