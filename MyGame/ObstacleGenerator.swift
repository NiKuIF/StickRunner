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
        
        return prodRandomObstacles(max_obst);
    }
    
    static func prodRandomObstacles(max: Int)->Array<ObstacleSquare>{
        var squares = Array<ObstacleSquare>()
        
        let pos_pool = ObstaclePosition(max_count: max)
        
        for _ in 1...max {
            let square = ObstacleSquare()
            square.position = pos_pool.getPosition()
            square.addSmallSquare()
            squares.append(square)
        }
        
        return squares;
    }
    
  }
