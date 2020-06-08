//
//  HighscoreSave.swift
//  MyGame
//
//  Created by Kurt Nistelberger on 01/05/16.
//  Copyright © 2016 Kurt Nistelberger. All rights reserved.
//

import Foundation

enum UserSaves {
    case highscore
}

class HighscoreSave {
    
    static func saveHighscore(_ highscore: NSInteger){
        let defaults = UserDefaults.standard
        defaults.setValue(highscore, forKey: "\(UserSaves.highscore)")
    }
    
    static func getHighscore()-> NSInteger{
        let defaults = UserDefaults.standard
        return defaults.integer(forKey: "\(UserSaves.highscore)");
    }
}
