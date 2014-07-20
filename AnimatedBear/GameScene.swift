import SpriteKit

class GameScene: SKScene {
    
    
    
    @lazy var bear:Bear = Bear()

    override func didMoveToView(view: SKView) {
        self.backgroundColor = SKColor.blackColor()
        
        bear.position = CGPointMake(CGRectGetMidX(self.frame), CGRectGetMidY(self.frame))
        
        
        
        self.addChild(bear)
    }
    
    
    
    override func touchesBegan(touches: NSSet, withEvent event: UIEvent) {
        /* Called when a touch begins
        
        for touch: AnyObject in touches {
            let location = touch.locationInNode(self)
            
            let sprite = SKSpriteNode(imageNamed:"Spaceship")
            
            sprite.xScale = 0.5
            sprite.yScale = 0.5
            sprite.position = location
            
            let action = SKAction.rotateByAngle(CGFloat(M_PI), duration:1)
            
            sprite.runAction(SKAction.repeatActionForever(action))
            
            self.addChild(sprite)
        }*/
    }
   
    override func touchesEnded(touches: NSSet!, withEvent event: UIEvent!) {
        let touch = touches.anyObject() as UITouch
        let position = touch.locationInNode(self)
        let screenSize = self.frame.size
        let bearVelocity = screenSize.width / 3.0
        let moveDifference = CGPointMake(position.x - bear.position.x, position.y - bear.position.y)
        let distanceToMove = sqrtf(moveDifference.x * moveDifference.x + moveDifference.y * moveDifference.y)
        let moveDuration = distanceToMove / bearVelocity
        
        var direction:CGFloat
        if moveDifference.x < 0 {
            direction = 1
        } else {
            direction = -1
        }
        
        bear.xScale = fabs(bear.xScale) * direction
        
        if bear.actionForKey("bearMoving"){
            bear.removeActionForKey("bearMoving")
        }
        if !bear.actionForKey("workingInPlaceBear") {
            bear.walking()
        }
        
        let moveAction:SKAction = SKAction.moveTo(position, duration: NSTimeInterval( moveDuration))
        let doneAction:SKAction = SKAction.runBlock({
                println("Animation Completed!")
                self.bear.moveEnded()
            })
//        var actionArray:NSMutableArray = NSMutableArray()
//        actionArray.addObject(moveAction)
//        actionArray.addObject(doneAction)
        
        let moveActionWithDone = SKAction.sequence([moveAction, doneAction])
        
        self.bear.runAction(moveActionWithDone)
    }
    
    
    
    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
    }
}
