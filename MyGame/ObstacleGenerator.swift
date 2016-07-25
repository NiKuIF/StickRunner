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
   
    static var wall_counter = 0;
    

    /*  Main Generator Method
     *  Creates Obstacles with attention
     *  to the current points
     */
    static func prodSimpleObstacles(points: Int)->Array<ObstacleSquare>{
        
        var max_obst: Int
        var add_high: Bool = false
        
        switch points {
        case 0..<5:
            max_obst = 1; break;
        case 5..<15:
            max_obst = (random() % 3) + 1; /* 1-3 */ break;
        case 15..<25:
            max_obst = (random() % 4) + 2; /* 2-5 */  break;
        default:
            max_obst = (random() % 6) + 2; /* 2-7 */  break;
        }
        
        // if we only produce 4 or less obst add a high obstacle 
        // when the points are above 30
        if(max_obst <= 4 && points >= 30){
            add_high = true
        }
        
        if(points >= 50) {
            wall_counter += 1;
            
            if(wall_counter >= 4) {
                wall_counter = 0;
                return prodWallObstacle();
            }
            else {
                wall_counter += 1;
            }
        }
        
        return prodRandomObstacles(max_obst, add_high: add_high);
    }
    
    private static func prodWallObstacle() ->Array<ObstacleSquare> {
        return ObstacleJumpPosition().getSquares()
    }
    
    static func prodRandomObstacles(max: Int, add_high: Bool)->Array<ObstacleSquare>{
        
        var squares = Array<ObstacleSquare>()
        
        // add low obstacles
        let pos_pool = ObstacleLowPosition(max_count: max)
        let low_pos = pos_pool.getPositions()
        
        for pos in low_pos {
            squares.append(prodSquare(pos))
        }
        
        // add high obstacles, always two high obstacles
        if(add_high){
            let high_obst = ObstacleHighPosition()
            let high_pos: Array<CGPoint> = high_obst.getPositions()
            
            for pos in high_pos {
                squares.append(prodSquare(pos, type: SQUARE_TYPE.RED))
            }
        }
        
        return squares;
    }
    
    static func prodSquare(pos: CGPoint, type: SQUARE_TYPE = SQUARE_TYPE.DEFAULT)->ObstacleSquare{
        
        let square = ObstacleSquare(type: type)
        square.position = pos
        square.addSmallSquare()
        return square;
    }
    
  }
