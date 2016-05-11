//
//  ObstacleGenerator.swift
//  MyGame
//
//  Created by Kurt Nistelberger on 10/05/16.
//  Copyright © 2016 Kurt Nistelberger. All rights reserved.
//

/*
 Class which Generates the Objects under attention 
 of the actual score
*/

import Foundation
import SpriteKit

class ObstacleGenerator {
   
    static func prodSingleObstacle()-> ObstacleSquare{
        
        let square = ObstacleSquare()
        square.position.x = SCENE_WIDTH
        square.position.y = SCENE_HEIGHT/2 -
            SCENE_HEIGHT/8 -
            square.size.height/2
        square.addSmallSquare()
       
        return square;
    }
    

    static func prodSimpleObstacles()->Array<ObstacleSquare>{
        var squares = Array<ObstacleSquare>()
        
        // how many squares should we produce
        let rand = (random() % 3) + 1 // 1-3
        
        let pos_pool = ObstaclePosition(max_count: rand)
        
        for _ in 1...rand {
            let square = ObstacleSquare()
            square.position = pos_pool.getPosition()
            NSLog("pos: (\(square.position.x),\(square.position.y))")
            square.addSmallSquare()
            squares.append(square)
        }
        
        return squares;
    }
    
    static func prodTowObstacle()->Array<ObstacleSquare>{
        var squares = Array<ObstacleSquare>()
        
        let square = ObstacleSquare()
        square.position.x = SCENE_WIDTH
        square.position.y = SCENE_HEIGHT/2 -
            SCENE_HEIGHT/8 -
            square.size.height/2
        square.addSmallSquare()
        
        let square1 = ObstacleSquare()
        square1.position.x = SCENE_WIDTH + SQUARE_SIDE
        square1.position.y = SCENE_HEIGHT/2 -
            SCENE_HEIGHT/8 -
            square1.size.height/2
        square1.addSmallSquare()
        
        squares.append(square)
        squares.append(square1)
        
        return squares;
    }
    
    static func prodThreeObstacle()->Array<ObstacleSquare>{
        var squares = Array<ObstacleSquare>()
        
        let square = ObstacleSquare()
        square.position.x = SCENE_WIDTH
        square.position.y = SCENE_HEIGHT/2 -
            SCENE_HEIGHT/8 -
            square.size.height/2
        square.addSmallSquare()
        
        let square1 = ObstacleSquare()
        square1.position.x = SCENE_WIDTH + SQUARE_SIDE
        square1.position.y = SCENE_HEIGHT/2 -
            SCENE_HEIGHT/8 -
            square1.size.height/2
        square1.addSmallSquare()
        
        let square2 = ObstacleSquare()
        square2.position.x = SCENE_WIDTH + SQUARE_SIDE/2
        square2.position.y = SCENE_HEIGHT/2 -
            SCENE_HEIGHT/8 -
            square2.size.height/2 + SQUARE_SIDE
        square2.addSmallSquare()
        
        squares.append(square)
        squares.append(square1)
        squares.append(square2)
        
        return squares;
    }
    
    static func prodFourObstacle()->Array<ObstacleSquare>{
        var squares = Array<ObstacleSquare>()
        
        let square = ObstacleSquare()
        square.position.x = SCENE_WIDTH
        square.position.y = SCENE_HEIGHT/2 -
            SCENE_HEIGHT/8 -
            square.size.height/2
        square.addSmallSquare()
        
        let square1 = ObstacleSquare()
        square1.position.x = SCENE_WIDTH + SQUARE_SIDE
        square1.position.y = SCENE_HEIGHT/2 -
            SCENE_HEIGHT/8 -
            square1.size.height/2
        square1.addSmallSquare()
        
        let square2 = ObstacleSquare()
        square2.position.x = SCENE_WIDTH
        square2.position.y = SCENE_HEIGHT/2 -
            SCENE_HEIGHT/8 -
            square2.size.height/2 + SQUARE_SIDE
        square2.addSmallSquare()
        
        let square3 = ObstacleSquare()
        square3.position.x = SCENE_WIDTH + SQUARE_SIDE
        square3.position.y = SCENE_HEIGHT/2 -
            SCENE_HEIGHT/8 -
            square3.size.height/2 + SQUARE_SIDE
        square3.addSmallSquare()
        
        squares.append(square)
        squares.append(square1)
        squares.append(square2)
        squares.append(square3)
        
        return squares;
    }
    
    static func prodTowHighObstacle()->Array<ObstacleSquare>{
        var squares = Array<ObstacleSquare>()
        
        let square = ObstacleSquare()
        square.position.x = SCENE_WIDTH
        square.position.y = SCENE_HEIGHT/2 -
            SCENE_HEIGHT/8 -
            square.size.height/2 + SQUARE_SIDE
        square.addSmallSquare()
        
        let square1 = ObstacleSquare()
        square1.position.x = SCENE_WIDTH + SQUARE_SIDE
        square1.position.y = SCENE_HEIGHT/2 -
            SCENE_HEIGHT/8 -
            square1.size.height/2 + SQUARE_SIDE
        square1.addSmallSquare()
        
        squares.append(square)
        squares.append(square1)
        
        return squares;
    }
    
    
}
