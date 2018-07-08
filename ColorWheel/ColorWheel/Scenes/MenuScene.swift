//
//  MenuScene.swift
//  ColorWheel
//
//  Created by Angela Rucci on 7/6/18.
//  Copyright © 2018 Angela Rucci. All rights reserved.
//

import SpriteKit

/// This scene is shown right after launch screen.
/// It will display High score and most recent score.
/// When user taps on this scene it will lead to Game
/// scene and the game will begin. 
class MenuScene: SKScene {
    override func didMove(to view: SKView) {
        backgroundColor = UIColor(red: 15/255, green: 38/255, blue: 62/255, alpha: 1.0)
        addLogo()
        addLabels()
    }
    
    
    /// Adds color wheel logo to main menu scene
    func addLogo() {
        let logo = SKSpriteNode(imageNamed: "colorWheelLogo")
        // TODO add in scaling to keep aspect ratio
        logo.size = CGSize(width: frame.size.width/1.5, height: frame.size.width/3)
        logo.position = CGPoint(x: frame.midX, y: frame.maxY - frame.size.width/3)
        addChild(logo)
    }
    
    /// Adds "Tap to play", "High Score", and "Recent high score" labels to menu scene
    func addLabels() {
        let playLabel = createTextNode(text: "TAP TO PLAY", nodeName: "PlayLabel", position: CGPoint(x: frame.midX, y: frame.midY), fontSize: CGFloat(50.0), fontColor: UIColor.white)
        let highScoreLabel = createTextNode(text: "High Score: \(UserDefaults.standard.integer(forKey: "high_score"))", nodeName: "HighScoreLabel", position: CGPoint(x: frame.midX, y: frame.midY), fontSize: CGFloat(35.0), fontColor: UIColor.white)
        let recentScoreLabel = createTextNode(text: "Recent Score: \(UserDefaults.standard.integer(forKey: "recent_score"))", nodeName: "RecentScoreLabel", position: CGPoint(x: frame.midX, y: frame.midY), fontSize: CGFloat(35.0), fontColor: UIColor.white)
        
        //have to override position because frame size is unknown at construction
        highScoreLabel.position = CGPoint(x: frame.midX, y: frame.midY - highScoreLabel.frame.size.height*4)
        recentScoreLabel.position = CGPoint(x: frame.midX, y: highScoreLabel.position.y - recentScoreLabel.frame.size.height*2)
        
        addChild(playLabel)
        animatePule(label: playLabel)
        addChild(highScoreLabel)
        addChild(recentScoreLabel)
    }
    
    
    /// When user touches screen, scene will change to Game Scene and game will begin 
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let gameScene = GameScene(size: view!.bounds.size)
        view!.presentScene(gameScene)
    }

}
