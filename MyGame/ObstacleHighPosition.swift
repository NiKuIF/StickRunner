//
//  ObstacleHighPosition.swift
//  MyGame
//
//  Created by Kurt Nistelberger on 17/05/16.
//  Copyright © 2016 Kurt Nistelberger. All rights reserved.
//

import Foundation
import SpriteKit

class ObstacleHighPosition{
    
    fileprivate var positions = Array<CGPoint>()
    
    init(){
        createPositionPool()
    }
    
    deinit{
        positions.removeAll()
    }
    
    func getPositions() -> Array<CGPoint>{
        return positions
    }
    
    fileprivate func createPositionPool(){
        
        // first left
        let pos1 = CGPoint(x: SCENE_WIDTH,
                           y: SCENE_HEIGHT/2 + SCENE_HEIGHT/6)
        
        // first right
        let pos2 = CGPoint(x: SCENE_WIDTH + SQUARE_SIDE,
                           y: SCENE_HEIGHT/2 + SCENE_HEIGHT/6)
        
        positions.append(pos1)
        positions.append(pos2)
    }
}
