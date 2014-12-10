//
//  HighScoreScreen.swift
//  Austin La Pizza
//
//  Created by Eric Seo on 12/8/14.
//  Copyright (c) 2014 The Fishermen. All rights reserved.
//

import SpriteKit

class HighScoreScreen: SKScene {
    var score = 0
    let goHomeButton = SKSpriteNode(imageNamed: "home")
    let highScoreBanner = SKSpriteNode(imageNamed: "highScore")
    
    
    override func didMoveToView(view: SKView) {
        self.backgroundColor = UIColor.whiteColor()
        
        self.highScoreBanner.size = CGSizeMake(200, 200)
        self.highScoreBanner.position = CGPointMake(CGRectGetMidX(self.frame), CGRectGetMidY(self.frame) + 80)
        
        self.goHomeButton.size = CGSizeMake(100, 100)
        self.goHomeButton.position = CGPointMake(CGRectGetMidX(self.frame), 50)
        
        self.addChild(highScoreBanner)
        self.addChild(goHomeButton)
    }
    
    
    override func touchesBegan(touches: NSSet, withEvent event: UIEvent) {
        for touch: AnyObject in touches {
            let location = touch.locationInNode(self) /* location of touch */
            if self.nodeAtPoint(location) == goHomeButton {
                var menuBackground = GameScene()
                menuBackground.size = self.size
                let skView = self.view
                skView?.ignoresSiblingOrder = true
                menuBackground.scaleMode = .ResizeFill
                
                var close = SKTransition.doorsCloseHorizontalWithDuration(0.5)
                
                skView?.presentScene(menuBackground, transition: close)
                
            }
        }
        
    }
    
    
}
