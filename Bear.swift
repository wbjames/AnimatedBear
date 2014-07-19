import SpriteKit

class Bear:SKSpriteNode {
    
    
    var bearAnimatedAtlas = SKTextureAtlas(named: "BearImages.atlas")
    var walkFrames = [SKTexture]()
    
    
    init() {
        let firstTexture:SKTexture = bearAnimatedAtlas.textureNamed("bear1")
        let size = firstTexture.size()
        super.init(texture: firstTexture, color: UIColor.whiteColor(), size: size)
        
        for i in 1...bearAnimatedAtlas.textureNames.count/2 {
            let textureName = String(format: "bear%d", i)
            let texture = bearAnimatedAtlas.textureNamed(textureName)
            if texture {
                walkFrames.append(texture)
                println(texture.size())
            }
            
        }
   //     println(walkFrames)
        
        walkingBear()
        
    }
    
    func walkingBear(){
        self.removeAllActions()
        println("bear walking steps = \(walkFrames.count)")
        self.runAction(SKAction.repeatActionForever(SKAction.animateWithTextures(walkFrames, timePerFrame: 0.1,
             resize: false, restore: true)), withKey: "walkingInPlaceBear")
        
    }
    
    
}
