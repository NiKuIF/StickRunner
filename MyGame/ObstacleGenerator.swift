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
        
        return prodRandomObstacles(max_obst, add_high: add_high);
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
                squares.append(prodSquare(pos))
            }
        }
        
        return squares;
    }
    
    static func prodSquare(pos: CGPoint)->ObstacleSquare{
        let square = ObstacleSquare()
        square.position = pos
        square.addSmallSquare()
        return square
    }
    
  }
