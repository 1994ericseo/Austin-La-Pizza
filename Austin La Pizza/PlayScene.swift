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
    let menuButton = SKSpriteNode(imageNamed: "Play")
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

    
    override func didMoveToView(view: SKView) {
        
        //setting background color to white
        self.backgroundColor = UIColor.blackColor()
        
        //setting gravity
        self.physicsWorld.gravity = CGVectorMake(0.0, -5.0)
        
        //menu button
        self.menuButton.size = CGSizeMake(50, 50)
        self.menuButton.position = CGPointMake(CGRectGetMaxX(self.frame) - 30, CGRectGetMaxY(self.frame) - 30)
        
        
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
        self.addChild(self.menuButton)
        
        
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
            if location == self.menuButton.position {
                var menu = GameScene()
                menu.scaleMode = .ResizeFill
                self.view?.ignoresSiblingOrder = true
                self.view?.presentScene(menu)
                
            }
        }
        
    }
    
    override func touchesEnded(touches: NSSet, withEvent event: UIEvent) {
        
        var pizzaTexture = SKTexture(imageNamed: "pizza")
        pizzaTexture.filteringMode = SKTextureFilteringMode.Nearest
        
        var pizza = SKSpriteNode(texture: pizzaTexture)
        
        pizza = SKSpriteNode(texture: pizzaTexture)
        pizza.setScale(0.2)
        
        pizza.physicsBody = SKPhysicsBody(circleOfRadius: pizza.size.height/2.0)
        pizza.physicsBody?.dynamic = true
        pizza.physicsBody?.allowsRotation = true
        
        
        self.addChild(pizza)
        //pizza.position = self.austin.position;
        pizza.position = CGPointMake(self.austin.size.width - 50, self.austin.size.height - 70)
        let velocity = CGFloat(NSDate().timeIntervalSinceDate(self.touchDuration))/5 + 0.2
        
            for touch: AnyObject in touches {
                let location = touch.locationInNode(self) /* location of touch */
                if self.nodeAtPoint(location) == self.menuButton {
                    var menuBackground = GameScene()
                    menuBackground.size = self.size
                    let skView = self.view
                    skView?.ignoresSiblingOrder = true
                    menuBackground.scaleMode = .ResizeFill
                    
                    var close = SKTransition.doorsCloseVerticalWithDuration(0.5)
                    
                    skView?.presentScene(menuBackground, transition: close)
                    
                }
                if (location.x >= pizza.position.x - 30) && (self.nodeAtPoint(location) != self.menuButton) {
                    pizza.physicsBody?.velocity = CGVector(dx: velocity, dy: velocity)

                
                    pizza.physicsBody?.applyImpulse((CGVector(dx: (location.x-pizza.position.x)*velocity, dy: (location.y-pizza.position.y)*velocity)))
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
        
        
        //move the background
        //background.position.x -= CGFloat(self.backgroundSpeed)
        
        //move the ground
        runningBar.position.x -= CGFloat(self.groundSpeed)
    }
}