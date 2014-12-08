//
//  ScoreScreen.swift
//  Austin La Pizza
//
//  Created by Eric Seo on 12/6/14.
//  Copyright (c) 2014 The Fishermen. All rights reserved.
//

import SpriteKit

class ScoreScreen: SKScene {
    var score = 0
    

    // To set the high score
    func newHighScore(score: Int) {
        var userDefaults = NSUserDefaults.standardUserDefaults()
        //userDefaults.setValue(highScore, forKey: "highScore")
        if score > userDefaults.integerForKey("highScore") {
            userDefaults.setInteger(score, forKey: "highScore")
            userDefaults.synchronize()
        }
    }
}
