//
//  PlayScene.swift
//  Austin La Pizza
//
//  Created by Eric Seo on 12/6/14.
//  Copyright (c) 2014 The Fishermen. All rights reserved.
//

import SpriteKit


class PlayScene: SKScene {
    
    /*AUSTIN LA PIZZA!!!*/
    let austin = SKSpriteNode(imageNamed: "Austin1")
    
    /*PAUSE BUTTON THAT CHANGES TO PLAY*/
    let pauseButton = SKSpriteNode(imageNamed: "pause")
    let playButton = SKTexture(imageNamed: "play")
    let pauseTexture = SKTexture(imageNamed: "pause")
    
    /*REPLAY AND HOME BUTTON AFTER PAUSE*/
    let replayButton = SKSpriteNode(imageNamed: "replay")
    let goHomeButton = SKSpriteNode(imageNamed: "home")
    
    /*PIZZA WING*/
    let pizzaWing = SKSpriteNode(imageNamed: "pizzaWing1")
    let pizzaWingTxt1 = SKTexture(imageNamed: "pizzaWing1")
    let pizzaWingTxt2 = SKTexture(imageNamed: "pizzaWing2")
    let pizzaWingTxt3 = SKTexture(imageNamed: "pizzaWing3")
    let pizzaWingTxt4 = SKTexture(imageNamed: "pizzaWing4")
    
    
    /*PIZZA LEGS*/
    let pizzaLegs = SKSpriteNode(imageNamed: "pizzaLegs1")
    let pizzaLegsTxt1 = SKTexture(imageNamed: "pizzaLegs1")
    let pizzaLegsTxt2 = SKTexture(imageNamed: "pizzaLegs2")
    let pizzaLegsTxt3 = SKTexture(imageNamed: "pizzaLegs3")
    let pizzaLegsTxt4 = SKTexture(imageNamed: "pizzaLegs4")
    
    
    
    /*BACKGROUND + RUNNING BAR/GROUND*/
    let background = SKSpriteNode(imageNamed: "gameBackground")
    let runningBar = SKSpriteNode(imageNamed: "Bar")
    
    /*NUMBERS*/
    var origRunningBarPosition = CGFloat(0)
    var origBackgroundPosition = CGFloat(0)
    var maxBackgroundX = CGFloat(0)
    var maxBarX = CGFloat(0)
    var groundSpeed = 3
    var backgroundSpeed = 5
    var touchDuration = NSDate()
    
    var points = 0
    
    var austinPositioned = false
    var austinPositioned2 = false
    var losecount = 0
    
    /*SCORE*/
    let scoreLabel = SKLabelNode(fontNamed: "Arial")
    
    /*TIME BEFORE START*/
    let readyLabel = SKSpriteNode(imageNamed: "ready")
    let goLabel = SKSpriteNode(imageNamed: "go")
    var readyLabelPositioned = false
    var goLabelPositioned = false
    var goLabelTime = 0
    
    
    /*keep track*/
    var trackPizza = SKSpriteNode()
    var trackBox = SKSpriteNode()
    var legs = false
    var throwNumber = 0
    
    
    override func didMoveToView(view: SKView) {
        
        //setting background color to white
        self.backgroundColor = UIColor.whiteColor()
        
        self.trackPizza.position = CGPointMake(300, 300)
        
        //setting gravity
        self.physicsWorld.gravity = CGVectorMake(0.0, -5.0)
        
        //pause button
        self.pauseButton.size = CGSizeMake(50, 50)
        self.pauseButton.position = CGPointMake(CGRectGetMinX(self.frame) + 25, CGRectGetMaxY(self.frame) - 25)
        self.pauseButton.zPosition += 1
        
        /* floor */
        self.runningBar.anchorPoint = CGPointMake(0, 0.5)
        self.runningBar.position = CGPointMake(CGRectGetMinX(self.frame)-100, CGRectGetMinY(self.frame) + (self.runningBar.size.height)/2)
        
        /* background */
        self.background.anchorPoint = CGPointMake(0.5, 0.5)
        self.background.size = CGSizeMake(4000,400)
        self.background.position = CGPointMake(CGRectGetMidX(self.frame), CGRectGetMidY(self.frame)+30)
        
        //pizza box size
        let size = CGSizeMake(164, 164)
        
        /* austin_____________________________________________________ */
        let austinTexture1 = SKTexture(imageNamed: "Austin1")
        let austinTexture2 = SKTexture(imageNamed: "Austin2")
        let austinTexture3 = SKTexture(imageNamed: "Austin3")
        
        var austinList = [austinTexture1, austinTexture2, austinTexture3]
        
        self.austin.size = CGSizeMake(200, 265)
        self.austin.position = CGPointMake(-100,100)
        
        
        var action = SKAction.repeatActionForever(SKAction.animateWithTextures(austinList, timePerFrame: 0.2, resize: false, restore: true))
        
        
        self.austin.runAction(action)
        self.austin.zPosition = self.runningBar.zPosition + 1
        
        self.addChild(self.runningBar)
        self.addChild(self.austin)
        
        self.addChild(self.pauseButton)
        
        /* go back to original sizes */
            /* BAR */
        self.origRunningBarPosition = self.runningBar.position.x
        self.maxBarX = self.runningBar.size.width - (self.frame.size.width+100)
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
                
                self.replayButton.size = CGSizeMake(70, 70)
                self.replayButton.position = CGPointMake(CGRectGetMidX(self.frame) - 40, 70)
                self.replayButton.zPosition += self.replayButton.zPosition + 2
                
                self.goHomeButton.size = CGSizeMake(70, 70)
                self.goHomeButton.position = CGPointMake(CGRectGetMidX(self.frame) + 40, 70)
                self.goHomeButton.zPosition += self.goHomeButton.zPosition + 2
                
                
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
        
        
        
        
        let velocity = CGFloat(NSDate().timeIntervalSinceDate(self.touchDuration))/5 + 0.025
        
            for touch: AnyObject in touches {
                let location = touch.locationInNode(self) /* location of touch */
                
                if self.nodeAtPoint(location) != self.pauseButton && self.nodeAtPoint(location) != self.goHomeButton && self.nodeAtPoint(location) != self.replayButton && self.scene?.paused == false && self.austinPositioned == true && self.throwNumber == 0 {
                    if location.x >= self.austin.position.x - 30 {
                        var pizza = SKSpriteNode(imageNamed: "pizza")
                    
                        pizza.setScale(0.7)
                        
                        pizza.physicsBody = SKPhysicsBody(texture: pizza.texture, size: pizza.size)
                        pizza.physicsBody?.dynamic = true
                        pizza.physicsBody?.allowsRotation = true
                        pizza.position = CGPointMake(self.austin.size.width - 50, self.austin.size.height - 120)
                        self.trackPizza = pizza
                        self.throwNumber += 1
                        self.addChild(pizza)
                        pizza.physicsBody?.velocity = CGVector(dx: velocity, dy: velocity)
                        pizza.physicsBody?.applyImpulse((CGVector(dx: (location.x-pizza.position.x)*velocity, dy: (location.y-pizza.position.y)*velocity)))
                    }
                }
            }
        
        
    }
    
    
    
    
    
    
    
    
    
    
    func randomBetweenNumbers(firstNum: CGFloat, secondNum: CGFloat) -> CGFloat{
        return CGFloat(arc4random()) / CGFloat(UINT32_MAX) * abs(firstNum - secondNum) + min(firstNum, secondNum)
    }
    
    func spawnPizzas() {
        
        let size = CGSizeMake(164, 164)
        
        var whichBox = 0 + Int(arc4random_uniform(UInt32(9 - 0 + 1)))
        var boxList = [self.pizzaWing, self.pizzaWing, self.pizzaWing, self.pizzaWing, self.pizzaWing, self.pizzaWing, self.pizzaWing, self.pizzaWing, self.pizzaLegs, self.pizzaLegs]
        
        var newBox = boxList[whichBox].copy() as SKSpriteNode
        var y = randomBetweenNumbers(100.0, secondNum: CGRectGetMaxY(self.frame)-50.0)
        
        /*pizza wing____________________________________________________*/
        if newBox == self.pizzaWing {
            newBox.size = size
            newBox.position = CGPointMake(CGRectGetMaxX(self.frame)+150, y)
            newBox.physicsBody = SKPhysicsBody(texture: newBox.texture, size: newBox.size)
            newBox.physicsBody?.affectedByGravity = false
            newBox.physicsBody?.dynamic = false
            
            var pizzaWingList = [self.pizzaWingTxt1, self.pizzaWingTxt2]
            var pizzaWingAnimation = SKAction.repeatActionForever(SKAction.animateWithTextures(pizzaWingList, timePerFrame: 0.2, resize: false, restore: true))
            newBox.runAction(pizzaWingAnimation, withKey: "animation1")
            
            


            self.trackBox = newBox
            self.legs = false
            

            var moveWing = SKAction.moveTo(CGPointMake(-300, newBox.position.y), duration: 5)
            newBox.runAction(moveWing)
            
            
            self.addChild(newBox)
            
            
        }
        
        /*pizza legs___________________________________________________*/
        else if newBox == self.pizzaLegs {
            newBox.size = size
            newBox.position = CGPointMake(CGRectGetMaxX(self.frame)+150, CGRectGetMidY(self.frame) - 100)
            newBox.physicsBody = SKPhysicsBody(texture: newBox.texture, size: newBox.size)
            newBox.physicsBody?.affectedByGravity = false
            newBox.physicsBody?.dynamic = false
            
            
            var pizzaLegList = [self.pizzaLegsTxt1, self.pizzaLegsTxt2]
            var pizzaLegAnimation = SKAction.repeatActionForever(SKAction.animateWithTextures(pizzaLegList, timePerFrame: 0.2, resize: false, restore: true))
            newBox.runAction(pizzaLegAnimation, withKey: "animation1" )
            
            

            self.trackBox = newBox
            self.legs = true
            
            
            var moveLegs = SKAction.moveTo(CGPointMake(-300, newBox.position.y), duration: 5)
            newBox.runAction(moveLegs)

            self.addChild(newBox)
            
            
        }
            
        
        

    }

    func beginScore() {
        self.scoreLabel.fontSize = 35
        self.scoreLabel.fontColor = SKColor.redColor()
        self.scoreLabel.text = NSString(format: "%u", self.points)
        self.scoreLabel.position = CGPoint(x: frame.size.width / 2, y: size.height - (40 + scoreLabel.frame.size.height/2))
        addChild(scoreLabel)
        
    }
    
    func updateScore() {
        self.scoreLabel.text = NSString(format: "%u", self.points)
    }
    
    func closePizza() {
        self.trackBox.removeActionForKey("animation1")
        
        var legList = [self.pizzaLegsTxt3, self.pizzaLegsTxt4]
        var wingList = [self.pizzaWingTxt3, self.pizzaWingTxt4]
        
        var action = SKAction()
        
        
        //var action = SKAction.repeatActionForever(SKAction.animateWithTextures(austinList, timePerFrame: 0.2, resize: false, restore: true))
        
        if self.legs == true {
            action = SKAction.animateWithTextures(legList, timePerFrame: 0.1)
        }
            
        else {
            action = SKAction.animateWithTextures(wingList, timePerFrame: 0.1)
        }
        
        self.trackBox.runAction(action)
        
    }
    
    func lose() {
        var loseScreen = ScoreScreen()
        loseScreen.score = self.points
        loseScreen.newHighScore()
        loseScreen.size = self.size
        let skView = self.view
        skView?.ignoresSiblingOrder = true
        loseScreen.scaleMode = .ResizeFill
        var reveal = SKTransition.fadeWithColor(UIColor.whiteColor(), duration: 0.5)
        
        skView?.presentScene(loseScreen, transition: reveal)
    }
    
    
    override func update(currentTime: NSTimeInterval) {
        if self.runningBar.position.x <= maxBarX {
            self.runningBar.position.x = self.origRunningBarPosition
        }
        /*if self.background.position.x <= maxBackgroundX {
            self.background.position.x = self.origBackgroundPosition
        } */
        if self.goLabelPositioned == true {
            self.goLabelTime += 1
        }
        
        if self.goLabelTime == 50 {
            self.goLabel.removeFromParent()
            self.goLabelPositioned = false
        }
        
        var moveAustin = SKAction.moveTo(CGPointMake(100,100), duration: 0.1)
        self.austin.runAction(moveAustin)
        
        if austin.position != CGPointMake(100, 100) && self.readyLabelPositioned == false {
            self.readyLabelPositioned = true
            self.readyLabel.size = CGSizeMake(150, 100)
            self.readyLabel.position = CGPoint(x: frame.size.width / 2, y: size.height - (150 + readyLabel.frame.size.height/2))
            addChild(readyLabel)
        }
        
        //austin positioned
        if austin.position == CGPointMake(100, 100) && self.austinPositioned == false {
            self.austinPositioned = true
            self.readyLabelPositioned = true
            self.goLabel.size = CGSizeMake(150, 100)
            self.goLabel.position = CGPoint(x: frame.size.width / 2, y: size.height - (150 + goLabel.frame.size.height/2))
            addChild(goLabel)
            self.goLabelPositioned = true
            self.readyLabel.removeFromParent()
            beginScore()
            spawnPizzas()
        }
        
        
        //scored!
        if self.trackBox.position.x < self.austin.position.x && self.trackBox.physicsBody?.allContactedBodies().count >= 1 {
            self.trackPizza.position = CGPointMake(300, 300)
            self.trackPizza.removeFromParent()
            self.points += 1
            self.throwNumber = 0
            closePizza()
            updateScore()
            spawnPizzas()
            
        }
        
        //self.trackPizza.physicsBody.al
        
        //LOSE CASE 1
        if self.trackPizza.position.y < self.frame.minY || self.trackPizza.position.x > self.frame.maxX {
            self.trackPizza.position = CGPointMake(100, 100)
            self.trackPizza.removeFromParent()
            lose()
        }
        
        //LOSE CASE 2
        if self.trackBox.position.x < self.austin.position.x - 20 && self.trackBox.physicsBody?.allContactedBodies().count == 0 {
            self.trackBox.position = CGPointMake(300, 300)
            self.trackBox.removeFromParent()
            lose()
        }
        
        
        
        //move the ground
        if self.scene?.paused == false {
            runningBar.position.x -= CGFloat(self.groundSpeed)
        }
    }
}