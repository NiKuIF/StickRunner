//
//  ObstacleJump.swift
//  MyGame
//
//  Created by Kurt Nistelberger on 25/07/16.
//  Copyright © 2016 Kurt Nistelberger. All rights reserved.
//


//
//  creates a wall object and a blue square infront
//  only with the blue square you can jump over the 
//  obstacle
//


import Foundation
import SpriteKit

class ObstacleJumpPosition{
    
    private var squares = Array<ObstacleSquare>()
    
    init(){
        
        // create blue square
        createBlueSquare();
    
        // create square wall
        createSquareWall();
    }
    
    deinit{
        squares.removeAll()
    }
    
    func createSquareWall() {
        
        
        let pos = CGPoint(x: SCENE_WIDTH + SQUARE_SIDE, y: SCENE_HEIGHT/2 - 10);
            
        let square = ObstacleSquare(type: SQUARE_TYPE.DEFAULT,
                                    size: CGSizeMake(SQUARE_SIDE, SQUARE_SIDE * 8));
        
        square.position = pos
        square.addSmallSquare()
        squares.append(square);
    }
    
    func createBlueSquare() {
        
        let pos = CGPoint(x: SCENE_WIDTH - SQUARE_SIDE,
                          y: SCENE_HEIGHT/2 -
                            SCENE_HEIGHT/8 -
                            SQUARE_SIDE/2)
        
        let square = ObstacleSquare(type: SQUARE_TYPE.BLUE)
        square.position = pos
        square.addSmallSquare()
        squares.append(square);
    }
    
    func getSquares()-> Array<ObstacleSquare> {
        return squares;
    }
    
}
