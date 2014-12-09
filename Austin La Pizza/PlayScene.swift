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
    let playButton = SKTexture(imageNamed: "Play")
    let pauseTexture = SKTexture(imageNamed: "pause")
    let pauseButton = SKSpriteNode(imageNamed: "pause")
    let background = SKSpriteNode(imageNamed: "gameBackground")
    
    let pizzaLegs1 = SKSpriteNode(imageNamed: "pizzaLegs1")
    let pizzaLegsTxt1 = SKTexture(imageNamed: "pizzaLegs1")
    let pizzaLegsTxt2 = SKTexture(imageNamed: "pizzaLegs2")
    
    let pizzaRocket1 = SKSpriteNode(imageNamed: "pizzaRocket1")
    let pizzaRocketTxt1 = SKTexture(imageNamed: "pizzaRocket1")
    let pizzaRocketTxt2 = SKTexture(imageNamed: "pizzaRocket2")
    
    let pizzaWing1 = SKSpriteNode(imageNamed: "pizzaWing1")
    let pizzaWingTxt1 = SKTexture(imageNamed: "pizzaWing1")
    let pizzaWingTxt2 = SKTexture(imageNamed: "pizzaWing2")
    
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
        self.backgroundColor = UIColor.blackColor()
        
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
        
            //pizza Wing
        self.pizzaWing1.size = size
        self.pizzaFlap.size = CGSizeMake(164, 164)
        //self.pizzaWing1.physicsBody = SKPhysicsBody(circleOfRadius: self.pizzaWing1.size.height/2.0)
        //self.pizzaFlap.physicsBody = SKPhysicsBody(circleOfRadius: self.pizzaWing1.size.height/2.0)
        self.pizzaWing1.position = CGPointMake(300, 350)
        self.pizzaFlap.position = CGPointMake(300, 350)
        var wingList = [self.pizzaWingTxt1, self.pizzaWingTxt2]
        var wingAction = SKAction.repeatActionForever(SKAction.animateWithTextures(wingList, timePerFrame: 0.3, resize: false, restore: true))
        self.pizzaWing1.runAction(wingAction)
        
            //pizza Legs
        self.pizzaLegs1.size = size
        self.pizzaLegs1.position = CGPointMake(450, 295)
        var pizzaFlap2 = self.pizzaFlap.copy() as SKSpriteNode
        pizzaFlap2.position = CGPointMake(450, 350)
        //self.pizzaLegs1.physicsBody = SKPhysicsBody(circleOfRadius: self.pizzaLegs1.size.height/2.0)
        var legList = [self.pizzaLegsTxt1, self.pizzaLegsTxt2]
        var legAction = SKAction.repeatActionForever(SKAction.animateWithTextures(legList, timePerFrame: 0.3, resize: false, restore: true))
        self.pizzaLegs1.runAction(legAction)
        
            //pizza Rocket
        self.pizzaRocket1.size = size
        self.pizzaRocket1.position = CGPointMake(400, 175)
        var pizzaFlap3 = self.pizzaFlap.copy() as SKSpriteNode
        pizzaFlap3.position = CGPointMake(400, 200)
        //self.pizzaRocket1.physicsBody = SKPhysicsBody(circleOfRadius: self.pizzaRocket1.size.height/2.0)
        var rocketList = [self.pizzaRocketTxt1, self.pizzaRocketTxt2]
        var rocketAction = SKAction.repeatActionForever(SKAction.animateWithTextures(rocketList, timePerFrame: 0.3, resize: false, restore: true))
        self.pizzaRocket1.runAction(rocketAction)
        
        
        /* austin_____________________________________________________ */
        let austinTexture1 = SKTexture(imageNamed: "Austin1")
        let austinTexture2 = SKTexture(imageNamed: "Austin2")
        let austinTexture3 = SKTexture(imageNamed: "Austin3")
        
        var austinList = [austinTexture1, austinTexture2, austinTexture3]
        
        self.austin1.size = CGSizeMake(200, 200)
        self.austin1.position = CGPointMake(100,100)
        
        
        var action = SKAction.repeatActionForever(SKAction.animateWithTextures(austinList, timePerFrame: 0.2, resize: false, restore: true))
        
        self.austin = austin1
        self.austin.runAction(action)
        
        self.addChild(self.runningBar)
        self.addChild(self.austin)
        self.addChild(self.pauseButton)
        self.addChild(self.pizzaFlap)
        self.addChild(self.pizzaWing1)
        self.addChild(pizzaFlap2)
        self.addChild(self.pizzaLegs1)
        self.addChild(pizzaFlap3)
        self.addChild(self.pizzaRocket1)
        
        
        var joint = SKPhysicsJointFixed.jointWithBodyA(self.pizzaWing1.physicsBody, bodyB: self.pizzaFlap.physicsBody, anchor: CGPointMake(self.pizzaWing1.position.x, self.pizzaWing1.position.y-30))
        //self.scene?.physicsWorld.addJoint(joint)
        
        
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
                var menu = GameScene()
                menu.size = self.size
                menu.scaleMode = .ResizeFill
                self.view?.ignoresSiblingOrder = true
                
                var close = SKTransition.doorsCloseVerticalWithDuration(0.5)
                
                
                //switch to play button
                
                self.view?.scene?.paused = true
                
                
            }
            else if self.nodeAtPoint(location) == self.pauseButton && self.view?.scene?.paused == true {
                
                //switch to pause button
                var switchToPlay = SKAction.setTexture(self.pauseTexture)
                self.pauseButton.runAction(switchToPlay)
                
                self.view?.scene?.paused = false
                
                
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
                
                if location != self.pauseButton.position {
                    if location.x >= pizza.position.x - 30 {
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
        
        if self.scene?.paused == true {
            
        }
        
        //move the background
        //background.position.x -= CGFloat(self.backgroundSpeed)
        
        //move the ground
        if self.scene?.paused == false {
            runningBar.position.x -= CGFloat(self.groundSpeed)
        }
    }
}