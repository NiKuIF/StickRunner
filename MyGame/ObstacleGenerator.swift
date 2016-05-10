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
   
    // maybe we can do better and produce a empty scene
    static var main_scene: SKScene = SKScene.init()
    
    static func prodSingleObstacle()-> ObstacleSquare{
        
        let square = ObstacleSquare()
        square.position.x = main_scene.size.width
        square.position.y = main_scene.size.height/2 -
            main_scene.size.height/8 -
            square.size.height/2
        square.addSmallSquare()
       
        return square;
    }
    
    
    static func prodTowObstacle()->Array<ObstacleSquare>{
        var squares = Array<ObstacleSquare>()
        
        let square = ObstacleSquare()
        square.position.x = main_scene.size.width
        square.position.y = main_scene.size.height/2 -
            main_scene.size.height/8 -
            square.size.height/2
        square.addSmallSquare()
        
        let square1 = ObstacleSquare()
        square1.position.x = main_scene.size.width + SQUARE_SIDE
        square1.position.y = main_scene.size.height/2 -
            main_scene.size.height/8 -
            square1.size.height/2
        square1.addSmallSquare()
        
        squares.append(square)
        squares.append(square1)
        
        return squares;
    }
    
    static func prodFourObstacle()->Array<ObstacleSquare>{
        var squares = Array<ObstacleSquare>()
        
        let square = ObstacleSquare()
        square.position.x = main_scene.size.width
        square.position.y = main_scene.size.height/2 -
            main_scene.size.height/8 -
            square.size.height/2
        square.addSmallSquare()
        
        let square1 = ObstacleSquare()
        square1.position.x = main_scene.size.width + SQUARE_SIDE
        square1.position.y = main_scene.size.height/2 -
            main_scene.size.height/8 -
            square1.size.height/2
        square1.addSmallSquare()
        
        let square2 = ObstacleSquare()
        square2.position.x = main_scene.size.width
        square2.position.y = main_scene.size.height/2 -
            main_scene.size.height/8 -
            square2.size.height/2 + SQUARE_SIDE
        square2.addSmallSquare()
        
        let square3 = ObstacleSquare()
        square3.position.x = main_scene.size.width + SQUARE_SIDE
        square3.position.y = main_scene.size.height/2 -
            main_scene.size.height/8 -
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
        square.position.x = main_scene.size.width
        square.position.y = main_scene.size.height/2 -
            main_scene.size.height/8 -
            square.size.height/2 + SQUARE_SIDE
        square.addSmallSquare()
        
        let square1 = ObstacleSquare()
        square1.position.x = main_scene.size.width + SQUARE_SIDE
        square1.position.y = main_scene.size.height/2 -
            main_scene.size.height/8 -
            square1.size.height/2 + SQUARE_SIDE
        square1.addSmallSquare()
        
        squares.append(square)
        squares.append(square1)
        
        return squares;
    }
    
    
}
