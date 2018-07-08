//
//  GameScene.swift
//  ColorWheel
//
//  Created by Angela Rucci on 7/4/18.
//  Copyright © 2018 Angela Rucci. All rights reserved.
//

import SpriteKit


/// This scene is where the game takes place.
/// Once user loses, the scene will be redirected
/// to the Menu Scene
class GameScene: SKScene {
    
    var colorSwitch: SKSpriteNode!     // Node of color switch
    var switchState = SwitchState.pink // State color switch is in
    var currentColorIndex: Int?        // Color/state the ball is in
    var scoreLabel: SKLabelNode!       // Node of score label
    var score = 0                      // Current score
    
    override func didMove(to view: SKView) {
        setUpPhysics()
        layoutScene()
    }
    
    
    /// Sets inital speed of ball drop
    func setUpPhysics() {
        physicsWorld.gravity = CGVector(dx: 0.0, dy: -1.5)
        physicsWorld.contactDelegate = self
    }
    
    /// Increses speed of ball drop
    func updatePhysicsWorld() {
        physicsWorld.gravity.dy -= CGFloat(0.5)
    }
   
    
    /// Sets layout of Game Scene adding on the
    /// color switch and score labels. Then makes
    /// call to release a ball and start game.
    func layoutScene() {
        backgroundColor = Layout.backgroundColor
        
        colorSwitch = createSpriteNode(node: SKSpriteNode(imageNamed: "colorCircle"), name: "ColorSwitch", size: CGSize(width: frame.size.width/2.5, height: frame.size.width/2.5), position: CGPoint(x: frame.midX, y: frame.minY+(frame.size.width/2.5)), zPosition: ZPostions.colorSwitch, physicsCategory: PhysicsCategories.switchCategory)
        colorSwitch.physicsBody?.isDynamic = false
        
        scoreLabel = createTextNode(text: "0", nodeName: "ScoreLabel", position: CGPoint(x: frame.midX, y: frame.midY), fontSize: CGFloat(60.0), fontColor: UIColor.white)
        
        addChild(colorSwitch)
        addChild(scoreLabel)
        releaseBall()
    }
    
    
    /// Updates the current score and plays
    /// success sound effect. If the current score
    /// is divisible by 5, then the game increases in dificulty
    /// by updating the speed of the ball drop
    func updateScoreAndScoreLabel(){
        score += 1
        scoreLabel.text = "\(score)"
        run(SKAction.playSoundFileNamed("success", waitForCompletion: false))
        if score % 5 == 0 {
            updatePhysicsWorld()
        }
    }
    
    
    /// Randomly selects a new color for the ball
    /// and adds the ball to the screen
    func releaseBall() {
        currentColorIndex = Int(arc4random_uniform(UInt32(6)))

        let ball = createSpriteNode(node: SKSpriteNode(texture: SKTexture(imageNamed: "ballImage")), name: "Ball", size: CGSize(width: 30.0, height: 30.0), position: CGPoint(x: frame.midX, y: frame.maxY), zPosition: ZPostions.ball, physicsCategory: PhysicsCategories.ballCategory)
    
        // Add additional properties to ball
        ball.color = GameColors.colors[currentColorIndex!]
        ball.colorBlendFactor = 1.0
        
        // Lets ball come in contact with color switch, but not collide with it
        ball.physicsBody?.contactTestBitMask = PhysicsCategories.switchCategory
        ball.physicsBody?.collisionBitMask = PhysicsCategories.none
        addChild(ball)
    }
    
    
    /// Turns the color switch wheel
    func turnWheel() {
        if let newState = SwitchState(rawValue: switchState.rawValue + 1){
            switchState = newState
        }else{
            switchState = .maroon
        }
        colorSwitch.run(SKAction.rotate(byAngle: .pi/3, duration: 0.167))
    }
    
    
    /// Saves the score as recent_score, and determines if recent score is high score.
    /// If the current score is high score, then save it as high_score. Then load
    /// Menu Scene.
    func gameOver() {
        UserDefaults.standard.set(score, forKey: "recent_score")
        if score > UserDefaults.standard.integer(forKey: "high_score"){
            UserDefaults.standard.set(score, forKey: "high_score")
        }
        let menuScene = MenuScene(size: view!.bounds.size)
        view!.presentScene(menuScene)
    }
    
    
    /// Turn wheel when screen is touched
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        turnWheel()
    }
    
}

/// Determines if the ball made contact with the switch
/// and if the switch was the same color as the ball. If
/// so add a point, else game is over.
extension GameScene: SKPhysicsContactDelegate {
    func didBegin(_ contact: SKPhysicsContact) {
        let contactMask = contact.bodyA.categoryBitMask | contact.bodyB.categoryBitMask
        
        if contactMask == PhysicsCategories.ballCategory | PhysicsCategories.switchCategory{
            // Assigning node to ball
            if let ball = contact.bodyA.node?.name == "Ball" ? contact.bodyA.node as? SKSpriteNode : contact.bodyB.node as? SKSpriteNode {
                if currentColorIndex == switchState.rawValue {
                    updateScoreAndScoreLabel()
                    ball.run(SKAction.fadeOut(withDuration: 0.25), completion: {
                        ball.removeFromParent()
                        self.releaseBall()
                    })
                }else{
                    gameOver()
                }
            }
        }
        
    }
}
