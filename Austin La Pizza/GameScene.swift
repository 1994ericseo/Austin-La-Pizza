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
    let banner2 = SKSpriteNode(imageNamed: "Image")
    
    
    
    
    override func didMoveToView(view: SKView) {
        self.playButton.position = CGPointMake(CGRectGetMidX(self.frame)-50, 100)
        self.banner.size = CGSizeMake(200, 200)
        self.banner.position = CGPointMake(CGRectGetMidX(self.frame), 500)
        self.banner2.position = CGPointMake(CGRectGetMidX(self.frame)+50, 100)
        self.addChild(banner)
        self.addChild(banner2)
        self.addChild(playButton)
        
        self.backgroundColor = UIColor.whiteColor()
        
    }
    
    override func touchesBegan(touches: NSSet, withEvent event: UIEvent) {
        for touch: AnyObject in touches {
            let location = touch.locationInNode(self) /* location of touch */
            if self.nodeAtPoint(location) == self.playButton {
                var scene = PlayScene(size: self.size)
                let skView = self.view
                skView?.ignoresSiblingOrder = true
                scene.scaleMode = .ResizeFill
                
                skView?.presentScene(scene)
                
                
                
                
            }
        }
        
    }
   
    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
    }
}
