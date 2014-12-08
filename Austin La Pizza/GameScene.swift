//
//  GameScene.swift
//  Austin La Pizza
//
//  Created by Eric Seo on 12/5/14.
//  Copyright (c) 2014 The Fishermen. All rights reserved.
//

import SpriteKit

class GameScene: SKScene {
    
    let playButton = SKSpriteNode(imageNamed: "Play")
    let banner = SKSpriteNode(imageNamed: "Image")
    let highscore = SKSpriteNode(imageNamed: "Image")
    let background = PlayScene()
    
    

    

    
    
    override func didMoveToView(view: SKView) {
        self.backgroundColor = UIColor.whiteColor()
        
        self.playButton.size = CGSizeMake(50, 50)
        self.playButton.position = CGPointMake(CGRectGetMidX(self.frame)-30, 50)
        
        self.banner.size = CGSizeMake(200, 200)
        self.banner.position = CGPointMake(CGRectGetMidX(self.frame), CGRectGetMidY(self.frame) + 80)
        
        self.highscore.size = CGSizeMake(50, 50)
        self.highscore.position = CGPointMake(CGRectGetMidX(self.frame)+30, 50)
        
        
        self.addChild(banner)
        self.addChild(highscore)
        self.addChild(playButton)
        
        
        
    }
    
    
    override func touchesBegan(touches: NSSet, withEvent event: UIEvent) {
        for touch: AnyObject in touches {
            let location = touch.locationInNode(self) /* location of touch */
            if self.nodeAtPoint(location) == self.playButton {
                background.size = self.size
                let skView = self.view
                skView?.ignoresSiblingOrder = true
                background.scaleMode = .ResizeFill
                
                
                skView?.presentScene(background)
                
                
                
                
            }
        }
        
    }
   
    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
    }
}
