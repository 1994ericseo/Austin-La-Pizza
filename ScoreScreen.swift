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
    
    let menuButton = SKSpriteNode(imageNamed: "Spaceship")
    
    
    
    
    override func didMoveToView(view: SKView) {
        self.backgroundColor = UIColor.whiteColor()
        self.menuButton.position = CGPointMake(CGRectGetMidX(self.frame), CGRectGetMidY(self.frame))
        self.addChild(menuButton)
        
    }
    
    override func touchesBegan(touches: NSSet, withEvent event: UIEvent) {
        for touch: AnyObject in touches {
            let location = touch.locationInNode(self) /* location of touch */
            if self.nodeAtPoint(location) == self.menuButton {
                var menuScene = GameScene(size: CGSizeMake(CGRectGetMaxX(self.frame), CGRectGetMaxY(self.frame)))
                self.view?.presentScene(menuScene)
            }
        }
    
    }
    

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
