//
//  PlayScene.swift
//  Austin La Pizza
//
//  Created by Eric Seo on 12/6/14.
//  Copyright (c) 2014 The Fishermen. All rights reserved.
//

import SpriteKit


class PlayScene: SKScene {

    /*required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    } */
    
    var austin = SKSpriteNode()
    let austin1 = SKSpriteNode(imageNamed: "Austin1")
    let austin2 = SKSpriteNode(imageNamed: "Austin2")
    let austin3 = SKSpriteNode(imageNamed: "Austin3")
    let background = SKSpriteNode(imageNamed: "gameBackground")
    
    let runningBar = SKSpriteNode(imageNamed: "Bar")
    
    var austinSpeed = 0
    var origRunningBarPosition = CGFloat(0)
    var origBackgroundPosition = CGFloat(0)
    var maxBackgroundX = CGFloat(0)
    var maxBarX = CGFloat(0)
    var groundSpeed = 3
    var backgroundSpeed = 5
    var austinPosition = CGFloat(0)
    
    
    var touchDuration = NSDate()
    
    
    //test
    var pizza = SKSpriteNode()
    
    override func didMoveToView(view: SKView) {
        
        //setting background color to white
        self.backgroundColor = UIColor.whiteColor()
        
        //setting gravity
        self.physicsWorld.gravity = CGVectorMake(0.0, -5.0)
        
        //pizza
        var pizzaTexture = SKTexture(imageNamed: "pizza")
        pizzaTexture.filteringMode = SKTextureFilteringMode.Nearest
        
        pizza = SKSpriteNode(texture: pizzaTexture)
        pizza.setScale(0.2)
        pizza.position = CGPointMake(self.frame.size.width * 0.35, self.frame.size.height * 0.6)
        pizza.physicsBody = SKPhysicsBody(circleOfRadius: pizza.size.height/2.0)
        pizza.physicsBody?.dynamic = true
        pizza.physicsBody?.allowsRotation = true
        
        self.addChild(pizza)
        
        /* floor */
        self.runningBar.anchorPoint = CGPointMake(0, 0.5)
        self.runningBar.position = CGPointMake(CGRectGetMinX(self.frame), CGRectGetMinY(self.frame) + (self.runningBar.size.height)/2)
        
        
        /* background */
        self.background.anchorPoint = CGPointMake(0.5, 0.5)
        self.background.size = CGSizeMake(4000,400)
        self.background.position = CGPointMake(CGRectGetMidX(self.frame), CGRectGetMidY(self.frame)+30)
        
        
        
        /* austin */
        
        let austinTexture1 = SKTexture(imageNamed: "Austin1")
        let austinTexture2 = SKTexture(imageNamed: "Austin2")
        let austinTexture3 = SKTexture(imageNamed: "Austin3")
        
        var austinList = [austinTexture1, austinTexture2, austinTexture3]
        
        self.austin1.size = CGSizeMake(200, 200)
        self.austin1.position = CGPointMake(100,100)
        
        
        var action = SKAction.repeatActionForever(SKAction.animateWithTextures(austinList, timePerFrame: 0.2, resize: false, restore: true))
        
        self.austin = austin1
        self.austin.runAction(action)
        //self.addChild(self.background)
        self.addChild(self.runningBar)
        self.addChild(self.austin)
        
        
        /* go back to original sizes */
            /* BAR */
        self.origRunningBarPosition = self.runningBar.position.x
        self.maxBarX = self.runningBar.size.width - (self.frame.size.width)
        self.maxBarX = self.maxBarX * -1
            /* BACKGROUND */
        self.origBackgroundPosition = self.background.position.x
        self.maxBackgroundX = self.background.size.width - (self.frame.size.width * 4)
        self.maxBackgroundX = self.maxBackgroundX * -1

    }
    
    override func touchesBegan(touches: NSSet, withEvent event: UIEvent) {
        self.touchDuration = NSDate()
        for touch: AnyObject in touches {
            let location = touch.locationInNode(self) /* location of touch */
            self.pizza.position = location
            /*if self.nodeAtPoint(location) == self.playButton {
                background.size = self.size
                let skView = self.view
                skView?.ignoresSiblingOrder = true
                background.scaleMode = .ResizeFill
                
                
                skView?.presentScene(background)
                
                
                
                
            }*/
        }
        
    }
    
    override func touchesEnded(touches: NSSet, withEvent event: UIEvent) {
        //self.touchDuration = NSDate() - self.touchDuration
    }
    
    override func update(currentTime: NSTimeInterval) {
        if self.runningBar.position.x <= maxBarX {
            self.runningBar.position.x = self.origRunningBarPosition
        }
        /*if self.background.position.x <= maxBackgroundX {
            self.background.position.x = self.origBackgroundPosition
        } */
        
        
        //move the background
        //background.position.x -= CGFloat(self.backgroundSpeed)
        
        //move the ground
        runningBar.position.x -= CGFloat(self.groundSpeed)
    }
}