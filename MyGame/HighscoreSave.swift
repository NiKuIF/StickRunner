//
//  HighscoreSave.swift
//  MyGame
//
//  Created by Kurt Nistelberger on 01/05/16.
//  Copyright © 2016 Kurt Nistelberger. All rights reserved.
//

import Foundation

enum UserSaves {
    case HIGHSCORE
}

class HighscoreSave {
    
    static func saveHighscore(highscore: NSInteger){
        let defaults = NSUserDefaults.standardUserDefaults()
        defaults.setValue(highscore, forKey: "\(UserSaves.HIGHSCORE)")
    }
    
    static func getHighscore()-> NSInteger{
        let defaults = NSUserDefaults.standardUserDefaults()
        return defaults.integerForKey("\(UserSaves.HIGHSCORE)");
    }
}