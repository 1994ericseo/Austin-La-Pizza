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
    let replayButton = SKSpriteNode(imageNamed: "Replay")
    let goHomeButton = SKSpriteNode(imageNamed: "Home")
    let gameOverBanner = SKSpriteNode(imageNamed: "GameOver")

    override func didMoveToView(view: SKView) {
        self.backgroundColor = UIColor.whiteColor()
        
        self.replayButton.size = CGSizeMake(50, 50)
        self.replayButton.position = CGPointMake(CGRectGetMidX(self.frame)-30, 50)
        
        self.gameOverBanner.size = CGSizeMake(200, 200)
        self.gameOverBanner.position = CGPointMake(CGRectGetMidX(self.frame), CGRectGetMidY(self.frame) + 80)
        
        self.goHomeButton.size = CGSizeMake(50, 50)
        self.goHomeButton.position = CGPointMake(CGRectGetMidX(self.frame)+30, 50)
        
        
        self.addChild(gameOverBanner)
        self.addChild(goHomeButton)
        self.addChild(replayButton)
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
    
    override func touchesBegan(touches: NSSet, withEvent event: UIEvent) {
        for touch: AnyObject in touches {
            let location = touch.locationInNode(self) /* location of touch */
            
            if self.nodeAtPoint(location) == self.replayButton {
                var gameBackground = PlayScene()
                gameBackground.size = self.size
                let skView = self.view
                skView?.ignoresSiblingOrder = true
                gameBackground.scaleMode = .ResizeFill
                
                
                var reveal = SKTransition.fadeWithColor(UIColor.whiteColor(), duration: 0.5)
                
                skView?.presentScene(gameBackground, transition: reveal)
            }
            
            if self.nodeAtPoint(location) == goHomeButton {
                var menuBackground = GameScene()
                menuBackground.size = self.size
                let skView = self.view
                skView?.ignoresSiblingOrder = true
                menuBackground.scaleMode = .ResizeFill
                
                
                var reveal = SKTransition.fadeWithColor(UIColor.whiteColor(), duration: 0.5)
                
                skView?.presentScene(menuBackground, transition: reveal)
                
            }
        }
        
    }

    
}


