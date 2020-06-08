//
//  GameState.swift
//  MyGame
//
//  Created by Kurt Nistelberger on 24/07/16.
//  Copyright © 2016 Kurt Nistelberger. All rights reserved.
//

//
//  a simple GameState class
//  based on a Property Observer
//

import Foundation

class GameStateClass {
    
    var game_state: GAME_STATE = GAME_STATE.start_SCREEN {
        willSet(new_state) {
            NSLog(" NEW_STATE : \(String(describing: new_state))");
            DebugWindow.printGameState(new_state);
        }
        didSet {
            // here you can compare with the oldValue
            // but make no sense with type enum
            /*if game_state > oldValue  {
                print("Added \(totalSteps - oldValue) steps")
            }*/
        }
    }
}
