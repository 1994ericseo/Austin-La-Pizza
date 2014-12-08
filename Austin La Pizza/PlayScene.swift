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
    
    var austin = SKSpriteNode()
    let austin1 = SKSpriteNode(imageNamed: "Austin1")
    let austin2 = SKSpriteNode(imageNamed: "Austin2")
    let austin3 = SKSpriteNode(imageNamed: "Austin3")
    
    var austinTime = 0
    var origRunningBarPosition = CGFloat(0)
    var maxBarX = CGFloat(0)
    var groundSpeed = 5
    var austinPosition = CGFloat(0)
    
    override func didMoveToView(view: SKView) {
        self.backgroundColor = UIColor.whiteColor()
        /* floor */
        self.runningBar.anchorPoint = CGPointMake(0, 0.5)
        self.runningBar.position = CGPointMake(CGRectGetMinX(self.frame), CGRectGetMinY(self.frame) + (self.runningBar.size.height)/2)
        self.addChild(self.runningBar)
        
        self.austin1.size = CGSizeMake(200, 200)
        self.austin1.position = CGPointMake(100,100)
        self.austin2.size = CGSizeMake(200, 200)
        self.austin2.position = CGPointMake(100,100)
        self.austin3.size = CGSizeMake(200, 200)
        self.austin3.position = CGPointMake(100,100)
        
        
        /* austin */
        
        self.austin = austin1
        self.addChild(self.austin)
        
        
        
        
        self.origRunningBarPosition = self.runningBar.position.x
        self.maxBarX = self.runningBar.size.width - (self.frame.size.width)
        self.maxBarX = self.maxBarX * -1
    }
    
    override func update(currentTime: NSTimeInterval) {
        if self.runningBar.position.x <= maxBarX {
            self.runningBar.position.x = self.origRunningBarPosition
        }
        
        switch austinTime {
        case 0:
            println("0")
            austinTime += 1
            self.austin = self.austin1
            break;
            
        case 1:
            println("1")
            austinTime += 1
            self.austin = self.austin2
            
            break;
        default:
            println("2")
            austinTime = 0
            self.austin = self.austin3
            
            break;
        }
        //if make, increase groundSpeed
        
        //if miss, decrease groundSpeed
        
        //move the ground
        runningBar.position.x -= CGFloat(self.groundSpeed)
    }
}