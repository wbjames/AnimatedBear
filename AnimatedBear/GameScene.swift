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
        var direction:CGFloat
        if position.x <= bear.position.x {
            direction = 1
        }else {
            direction = -1
        }
        
        bear.xScale = fabs(bear.xScale) * direction
        
    }
    
    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
    }
}
