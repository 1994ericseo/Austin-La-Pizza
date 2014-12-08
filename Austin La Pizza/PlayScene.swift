//
//  PlayScene.swift
//  Austin La Pizza
//
//  Created by Eric Seo on 12/6/14.
//  Copyright (c) 2014 The Fishermen. All rights reserved.
//

import SpriteKit




class PlayScene: SKScene {
    let runningBar = SKSpriteNode(imageNamed: "Bar")
    var origRunningBarPosition = CGFloat(0)
    var maxBarX = CGFloat(0)
    var groundSpeed = 5
    
    override func didMoveToView(view: SKView) {
        println("We are at the new scene")
        self.backgroundColor = UIColor.whiteColor()
        self.runningBar.anchorPoint = CGPointMake(0, 0.5)
        self.runningBar.position = CGPointMake(CGRectGetMinX(self.frame), CGRectGetMinY(self.frame) + (self.runningBar.size.height)/2)
        self.addChild(self.runningBar)
        self.origRunningBarPosition = self.runningBar.position.x
        self.maxBarX = self.runningBar.size.width - (self.frame.size.width)
        self.maxBarX = self.maxBarX * -1
    }
    
    override func update(currentTime: NSTimeInterval) {
        if self.runningBar.position.x <= maxBarX {
            self.runningBar.position.x = self.origRunningBarPosition
        }
        
        //if make, increase groundSpeed
        
        //if miss, decrease groundSpeed
        
        //move the ground
        runningBar.position.x -= CGFloat(self.groundSpeed)
    }
}