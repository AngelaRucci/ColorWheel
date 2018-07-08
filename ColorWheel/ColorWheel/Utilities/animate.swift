//
//  Animate.swift
//  ColorWheel
//
//  Created by Angela Rucci on 7/7/18.
//  Copyright © 2018 Angela Rucci. All rights reserved.
//

import SpriteKit


/// Animates text mode by giving it a pulsing animation
///
/// - Parameter label: node of label to be bounced 
func animatePule(label : SKLabelNode){
    let scaleUp = SKAction.scale(to: 1.1, duration: 0.5)
    let scaleDown = SKAction.scale(to: 1.0, duration: 0.5)
    let sequence = SKAction.sequence([scaleUp, scaleDown])
    label.run(SKAction.repeatForever(sequence))
}
