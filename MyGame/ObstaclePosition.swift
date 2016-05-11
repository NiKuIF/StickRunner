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
    
    deinit{
        positions.removeAll()
    }
    
    func getPosition() -> CGPoint{
        //let pos_index = random() % max_positions
        let ret_pos = positions[max_positions-1]
        positions.removeAtIndex(max_positions-1)
        max_positions -= 1
        return ret_pos
    }

    private func createPositionPool(){
        
        // first left
        let pos1 = CGPoint(x: SCENE_WIDTH,
                           y: SCENE_HEIGHT/2 -
                              SCENE_HEIGHT/8 -
                              SQUARE_SIDE/2)
        
        // first right
        let pos2 = CGPoint(x: SCENE_WIDTH + SQUARE_SIDE,
                           y: SCENE_HEIGHT/2 -
                              SCENE_HEIGHT/8 -
                              SQUARE_SIDE/2)
        
        // second right
        let pos3 = CGPoint(x: SCENE_WIDTH + SQUARE_SIDE,
                           y: SCENE_HEIGHT/2 -
                              SCENE_HEIGHT/8 -
                              SQUARE_SIDE/2 + SQUARE_SIDE)
        
        // second left
        let pos4 = CGPoint(x: SCENE_WIDTH,
                           y: SCENE_HEIGHT/2 -
                              SCENE_HEIGHT/8 -
                              SQUARE_SIDE/2 + SQUARE_SIDE)
        
        // third middle
        let pos5 = CGPoint(x: SCENE_WIDTH + SQUARE_SIDE/2,
                           y: SCENE_HEIGHT/2 -
                              SCENE_HEIGHT/8 -
                              SQUARE_SIDE/2 + SQUARE_SIDE*2)
        
        // first left 2
        let pos6 = CGPoint(x: SCENE_WIDTH - SQUARE_SIDE,
                           y: SCENE_HEIGHT/2 -
                              SCENE_HEIGHT/8 -
                              SQUARE_SIDE/2)
        // first right 2
        let pos7 = CGPoint(x: SCENE_WIDTH + SQUARE_SIDE*2,
                           y: SCENE_HEIGHT/2 -
                              SCENE_HEIGHT/8 -
                              SQUARE_SIDE/2)
        
        positions.append(pos1)
        positions.append(pos2)
        positions.append(pos3)
        positions.append(pos4)
        positions.append(pos5)
        positions.append(pos6)
        positions.append(pos7)
    }
}