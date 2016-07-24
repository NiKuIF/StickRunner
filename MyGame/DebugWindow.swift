//
//  DebugWindow.swift
//  MyGame
//
//  Created by Kurt Nistelberger on 24/07/16.
//  Copyright © 2016 Kurt Nistelberger. All rights reserved.
//

//
//  a simple Debug Window, where I can print the positon 
//  and other actions that happend 
//

import Foundation
import UIKit

class DebugWindow {
    
    static var enable = false;
    static var debug_window: UITextView!;
    
    // temp save strings
    private static var gs_string = "GameState: start";
    private static var hp_string = "HeroPos: (0.00, 0.00)";
    
    static func printGameState(state: GAME_STATE) {
        if(!enable) { return;}
        
        gs_string = "GameState: ";
        
        switch state {
        case .GAME_PLAY:
            gs_string += "PLAY";
            break
        case .GAME_DEAD:
            gs_string += "DEAD";
            break
        case .START_SCREEN:
            gs_string += "Start_Screen";
            break
        default:
            gs_string += "undefind";
        }
        
        debug_window.text = gs_string + "\n" + hp_string;
        
        // you have to set the color after every write -> NSMutableString
        debug_window.textColor = UIColor.brownColor();
    }
    
    static func printHeroPos(x_pos: Int, y_pos: Int) {
        if(!enable) { return;}
        
        hp_string = "HeroPos: (" + String(x_pos) + ", " + String(y_pos) + ")";
        
        debug_window.text = gs_string + "\n" + hp_string;
        
        // you have to set the color after every write -> NSMutableString
        debug_window.textColor = UIColor.brownColor();
    }
    
    static func printJump() {
        
    }
}
