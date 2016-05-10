//
//  ObstaclePosition.swift
//  MyGame
//
//  Created by Kurt Nistelberger on 11/05/16.
//  Copyright © 2016 Kurt Nistelberger. All rights reserved.
//

import Foundation
import SpriteKit

class ObstaclePosition{
    
    private var max_positions: Int
    private var positions = Array<CGPoint>()
    
    init(max_count: Int){
        max_positions = max_count
        createPositionPool()
    }
    
    func getPosition() -> CGPoint{
        let pos_index = random() % max_positions
        let ret_pos = positions[pos_index]
        positions.removeAtIndex(pos_index)
        max_positions -= 1
        return ret_pos
    }
    
    private func createPositionPool(){
        //if(max_positions == 3){
            createThreePos()
       // }
    }
    
    private func createThreePos(){

        let pos1 = CGPoint(x: SCENE_WIDTH,
                           y: SCENE_HEIGHT/2 -
                              SCENE_HEIGHT/8 -
                              SQUARE_SIDE/2)
        
        let pos2 = CGPoint(x: SCENE_WIDTH + SQUARE_SIDE,
                           y: SCENE_HEIGHT/2 -
                              SCENE_HEIGHT/8 -
                              SQUARE_SIDE/2)
        
        let pos3 = CGPoint(x: SCENE_WIDTH + SQUARE_SIDE/2,
                           y: SCENE_HEIGHT/2 -
                              SCENE_HEIGHT/8 -
                              SQUARE_SIDE/2 + SQUARE_SIDE)
        
        positions.append(pos1)
        positions.append(pos2)
        positions.append(pos3)
    }
}