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
    
    
    
    
    let austin = SKSpriteNode(imageNamed: "Austin1")
    
    
    let playButton = SKTexture(imageNamed: "Play")
    
    
    
    let pauseTexture = SKTexture(imageNamed: "pause")
    let pauseButton = SKSpriteNode(imageNamed: "pause")
    let background = SKSpriteNode(imageNamed: "gameBackground")
    
    let replayButton = SKSpriteNode(imageNamed: "Replay")
    let goHomeButton = SKSpriteNode(imageNamed: "Home")
    
    let pizzaLegs1 = SKSpriteNode(imageNamed: "pizzaLegs1")
    let pizzaLegsTxt1 = SKTexture(imageNamed: "pizzaLegs1")
    let pizzaLegsTxt2 = SKTexture(imageNamed: "pizzaLegs2")
    
    let pizzaRocket1 = SKSpriteNode(imageNamed: "pizzaRocket1")
    let pizzaRocketTxt1 = SKTexture(imageNamed: "pizzaRocket1")
    let pizzaRocketTxt2 = SKTexture(imageNamed: "pizzaRocket2")
    
    
    let pizzaWingTxt1 = SKTexture(imageNamed: "pizzaWing1")
    let pizzaWingTxt2 = SKTexture(imageNamed: "pizzaWing2")
    
    
    //test images
    let pizzaWing = SKSpriteNode(imageNamed: "pizzaWing1")
    let pizzaWing2 = SKTexture(imageNamed: "pizzaWing2")
    
    let pizzaFlap = SKSpriteNode(imageNamed: "pizzaFlap")
    
    
    let runningBar = SKSpriteNode(imageNamed: "Bar")
    
    var origRunningBarPosition = CGFloat(0)
    var origBackgroundPosition = CGFloat(0)
    var maxBackgroundX = CGFloat(0)
    var maxBarX = CGFloat(0)
    var groundSpeed = 3
    var backgroundSpeed = 5
    
    
    
    
    var touchDuration = NSDate()
    
    
    //test

    
    override func didMoveToView(view: SKView) {
        
        //setting background color to white
        self.backgroundColor = UIColor.whiteColor()
        
        //setting gravity
        self.physicsWorld.gravity = CGVectorMake(0.0, -5.0)
        
        //pause button
        self.pauseButton.size = CGSizeMake(50, 50)
        self.pauseButton.position = CGPointMake(CGRectGetMaxX(self.frame) - 30, CGRectGetMaxY(self.frame) - 30)
        
        
        
        
        
        /* floor */
        self.runningBar.anchorPoint = CGPointMake(0, 0.5)
        self.runningBar.position = CGPointMake(CGRectGetMinX(self.frame), CGRectGetMinY(self.frame) + (self.runningBar.size.height)/2)
        
        
        /* background */
        self.background.anchorPoint = CGPointMake(0.5, 0.5)
        self.background.size = CGSizeMake(4000,400)
        self.background.position = CGPointMake(CGRectGetMidX(self.frame), CGRectGetMidY(self.frame)+30)
        
        /* pizza boxes__________________________________________________ */
        let size = CGSizeMake(164, 164)
        
        
        //piza wing
        self.pizzaWing.size = size
        self.pizzaWing.position = CGPointMake(CGRectGetMidX(self.frame), CGRectGetMidY(self.frame)+30)
        self.pizzaWing.physicsBody = SKPhysicsBody(texture: self.pizzaWing.texture, size: self.pizzaWing.size)
        self.pizzaWing.physicsBody?.affectedByGravity = false
        self.pizzaWing.physicsBody?.dynamic = false
        
        self.addChild(self.pizzaWing)
        
            //pizza Wing
        
        
            //pizza Legs
        
        
            //pizza Rocket
        
        
        
        /* austin_____________________________________________________ */
        let austinTexture1 = SKTexture(imageNamed: "Austin1")
        let austinTexture2 = SKTexture(imageNamed: "Austin2")
        let austinTexture3 = SKTexture(imageNamed: "Austin3")
        
        var austinList = [austinTexture1, austinTexture2, austinTexture3]
        
        self.austin.size = CGSizeMake(200, 200)
        self.austin.position = CGPointMake(100,85)
        
        
        var action = SKAction.repeatActionForever(SKAction.animateWithTextures(austinList, timePerFrame: 0.2, resize: false, restore: true))
        
        
        self.austin.runAction(action)
        self.austin.zPosition = self.runningBar.zPosition + 1
        
        self.addChild(self.runningBar)
        self.addChild(self.austin)
        
        
        
        self.addChild(self.pauseButton)
        
        
        
        
        
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
            if self.nodeAtPoint(location) == self.pauseButton && self.view?.scene?.paused == false {
                
                
                self.pauseButton.texture = self.playButton
                
                self.replayButton.size = CGSizeMake(50, 50)
                self.replayButton.position = CGPointMake(CGRectGetMidX(self.frame)-30, 70)
                
                self.goHomeButton.size = CGSizeMake(50, 50)
                self.goHomeButton.position = CGPointMake(CGRectGetMidX(self.frame)+30, 70)
                
                self.addChild(goHomeButton)
                self.addChild(replayButton)
                
                //switch to play button
                
                self.view?.scene?.paused = true
                
                
            }
            else if self.nodeAtPoint(location) == self.pauseButton && self.view?.scene?.paused == true {
                
                //switch to pause button
                self.goHomeButton.removeFromParent()
                self.replayButton.removeFromParent()
                
                self.pauseButton.texture = self.pauseTexture
                self.view?.scene?.paused = false
                
                
            }
            
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
    
    override func touchesEnded(touches: NSSet, withEvent event: UIEvent) {
        
        
        
        var pizza = SKSpriteNode(imageNamed: "pizza")
        
        
        pizza.setScale(0.7)
        
        pizza.physicsBody = SKPhysicsBody(texture: pizza.texture, size: pizza.size)
        pizza.physicsBody?.dynamic = true
        pizza.physicsBody?.allowsRotation = true
        
        
        
        //pizza.position = self.austin.position;
        pizza.position = CGPointMake(self.austin.size.width - 50, self.austin.size.height - 80)
        let velocity = CGFloat(NSDate().timeIntervalSinceDate(self.touchDuration))/5 + 0.05
        
            for touch: AnyObject in touches {
                let location = touch.locationInNode(self) /* location of touch */
                
                if self.nodeAtPoint(location) != self.pauseButton && self.nodeAtPoint(location) != self.goHomeButton && self.nodeAtPoint(location) != self.replayButton && self.scene?.paused == false {
                    if location.x >= pizza.position.x - 30 {
                        self.addChild(pizza)
                        pizza.physicsBody?.velocity = CGVector(dx: velocity, dy: velocity)
                        pizza.physicsBody?.applyImpulse((CGVector(dx: (location.x-pizza.position.x)*velocity, dy: (location.y-pizza.position.y)*velocity)))
                    }
                }
            }
        
        
    }
    
    override func update(currentTime: NSTimeInterval) {
        if self.runningBar.position.x <= maxBarX {
            self.runningBar.position.x = self.origRunningBarPosition
        }
        /*if self.background.position.x <= maxBackgroundX {
            self.background.position.x = self.origBackgroundPosition
        } */
        
        /*var moveWing = SKAction.moveTo(CGPointMake(-300, pizzaWing1.position.y), duration: 5)
        self.pizzaWing1.runAction(moveWing)
        
        var moveLegs = SKAction.moveTo(CGPointMake(-300, pizzaLegs1.position.y), duration: 5)
        self.pizzaLegs1.runAction(moveLegs) */
        
        
        //move the background
        //background.position.x -= CGFloat(self.backgroundSpeed)
        
        //move the ground
        if self.scene?.paused == false {
            runningBar.position.x -= CGFloat(self.groundSpeed)
        }
    }
}