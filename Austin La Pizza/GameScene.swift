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
    let austin = SKSpriteNode(imageNamed: "Austin1")
    let game = PlayScene()
    let score = HighScoreScreen()
    
    

    
    
    override func didMoveToView(view: SKView) {
        self.backgroundColor = UIColor.whiteColor()
        
        let austinTexture1 = SKTexture(imageNamed: "Austin1")
        let austinTexture2 = SKTexture(imageNamed: "Austin2")
        let austinTexture3 = SKTexture(imageNamed: "Austin3")
        
        var austinList = [austinTexture1, austinTexture2, austinTexture3]
        
        self.austin.size = CGSizeMake(200, 200)
        self.austin.position = CGPointMake(100,100)
        var action = SKAction.repeatActionForever(SKAction.animateWithTextures(austinList, timePerFrame: 0.2, resize: false, restore: true))
        
        self.austin.runAction(action)
        self.addChild(self.austin)
        
        
        
        self.playButton.size = CGSizeMake(50, 50)
        self.playButton.position = CGPointMake(CGRectGetMidX(self.frame)-30, 50)
        
        self.banner.size = CGSizeMake(200, 200)
        self.banner.position = CGPointMake(CGRectGetMidX(self.frame), CGRectGetMidY(self.frame) + 80)
        
        self.highscore.size = CGSizeMake(50, 50)
        self.highscore.position = CGPointMake(CGRectGetMidX(self.frame)+30, 50)
        
        /*var nodeAction = SKAction.fadeInWithDuration(NSTimeInterval(2.0))
        self.banner.runAction(nodeAction)
        self.playButton.runAction(nodeAction)
        self.highscore.runAction(nodeAction) */
        
        self.addChild(self.banner)
        self.addChild(self.highscore)
        self.addChild(self.playButton)
        
        
        
        
        
    }
    
    
    override func touchesBegan(touches: NSSet, withEvent event: UIEvent) {
        for touch: AnyObject in touches {
            let location = touch.locationInNode(self) /* location of touch */
            if self.nodeAtPoint(location) == self.playButton {
                self.game.size = self.size
                let skView = self.view
                skView?.ignoresSiblingOrder = true
                self.game.scaleMode = .ResizeFill
                
                var reveal = SKTransition.doorsOpenVerticalWithDuration(0.5)
                
                skView?.presentScene(self.game, transition: reveal)
            }
            if self.nodeAtPoint(location) == self.highscore {
                self.score.size = self.size
                self.view?.ignoresSiblingOrder = true
                self.score.scaleMode = .ResizeFill
                
                var open = SKTransition.doorsOpenHorizontalWithDuration(0.5)
                self.view?.presentScene(self.score, transition: open)
            }
        }
        
    }
   
    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
    }
}
