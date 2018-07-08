//
//  GameViewController.swift
//  ColorWheel
//
//  Created by Angela Rucci on 7/4/18.
//  Copyright © 2018 Angela Rucci. All rights reserved.
//

import UIKit
import SpriteKit

class GameViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let view = self.view as! SKView? {
            // Load the SKScene from 'MenuScene.sks'
            let scene = MenuScene(size: view.bounds.size)
            
            // Set the scale mode to scale to fit the window
            scene.scaleMode = .aspectFill
            
            // Present the scene
            view.presentScene(scene)
            
            // Elements of scene can be rendered in a nonfixed way
            view.ignoresSiblingOrder = true
        }
    }

}


