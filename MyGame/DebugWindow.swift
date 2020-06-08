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
    fileprivate static var gs_str = "GameState: start";
    fileprivate static var hp_str = "HeroPos: (0.00, 0.00)";
    fileprivate static var jm_str = "Jmp_Cnt: 0";
    
    
    static func clearScreen(){
        debug_window.text = "";
    }
    
    static func printGameState(_ state: GAME_STATE) {
        if(!enable) { return;}
        
        gs_str = "GameState: ";
        
        switch state {
        case .game_PLAY:
            gs_str += "PLAY";
            break
        case .game_DEAD:
            gs_str += "DEAD";
            break
        case .start_SCREEN:
            gs_str += "Start_Screen";
            break
        default:
            gs_str += "undefind";
        }
        
        debug_window.text = gs_str + "\n" + hp_str + "\n" + jm_str;
        
        // you have to set the color after every write -> NSMutableString
        debug_window.textColor = UIColor.brown;
    }
    
    static func printHeroPos(_ x_pos: CGFloat, y_pos: CGFloat) {
        if(!enable) { return;}
        
        hp_str = "HeroPos: (" + String(describing: x_pos) + ", " + String(describing: y_pos) + ")";
        
        debug_window.text = gs_str + "\n" + hp_str + "\n" + jm_str;
        
        // you have to set the color after every write -> NSMutableString
        debug_window.textColor = UIColor.brown;
    }
    
    static func printJump(_ count: Int) {
        if(!enable) { return;}

        jm_str = "Jmp_Cnt: " + String(count);
        debug_window.text = gs_str + "\n" + hp_str + "\n" + jm_str;
        
        // you have to set the color after every write -> NSMutableString
        debug_window.textColor = UIColor.brown;
    }
}
