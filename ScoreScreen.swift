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
    let replayButton = SKSpriteNode(imageNamed: "replay")
    let goHomeButton = SKSpriteNode(imageNamed: "home")
    //let gameOverBanner = SKSpriteNode(imageNamed: "GameOver")
    let scoreLabel = SKLabelNode(fontNamed: "Arial")
    let highScoreLabel = SKLabelNode(fontNamed: "Arial")

    override func didMoveToView(view: SKView) {
        self.backgroundColor = UIColor.whiteColor()
        
        self.replayButton.size = CGSizeMake(50, 50)
        self.replayButton.position = CGPointMake(CGRectGetMidX(self.frame)-30, 50)
        
        //self.gameOverBanner.size = CGSizeMake(200, 200)
        //self.gameOverBanner.position = CGPointMake(CGRectGetMidX(self.frame), CGRectGetMidY(self.frame) + 80)
        
        self.scoreLabel.fontSize = 35
        self.scoreLabel.fontColor = SKColor.redColor()
        self.scoreLabel.text = NSString(format: "Score: %u", self.score)
        self.scoreLabel.position = CGPoint(x: frame.size.width / 2, y: size.height - (100 + scoreLabel.frame.size.height/2))
        addChild(self.scoreLabel)
        
        self.highScoreLabel.fontSize = 35
        self.highScoreLabel.fontColor = SKColor.redColor()
        self.highScoreLabel.text = NSString(format: "High Score: %u", NSUserDefaults.standardUserDefaults().integerForKey("highScore"))
        self.highScoreLabel.position = CGPoint(x: frame.size.width / 2, y: size.height - (150 + highScoreLabel.frame.size.height/2))
        
        
        self.goHomeButton.size = CGSizeMake(50, 50)
        self.goHomeButton.position = CGPointMake(CGRectGetMidX(self.frame)+30, 50)
        
        
        //self.addChild(gameOverBanner)
        self.addChild(goHomeButton)
        self.addChild(replayButton)
        self.addChild(highScoreLabel)
    }


    // To set the high score
    func newHighScore() {
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


