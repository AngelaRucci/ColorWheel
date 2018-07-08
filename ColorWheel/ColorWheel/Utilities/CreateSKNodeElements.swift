//
//  CreateSKNodeElements.swift
//  ColorWheel
//
//  Created by Angela Rucci on 7/7/18.
//  Copyright © 2018 Angela Rucci. All rights reserved.
//

import SpriteKit


/// Used to create and set the properties of a label node
///
/// - Parameters:
///   - text: Text for label
///   - nodeName: name to identify node
///   - position: position of node on scene
///   - fontSize: size of text
///   - fontColor: color of text
/// - Returns: SKLabelNode
func createTextNode(text: String, nodeName: String, position: CGPoint, fontSize: CGFloat, fontColor: UIColor) -> SKLabelNode {
    let labelNode = SKLabelNode(fontNamed: Layout.font)
    labelNode.name = nodeName
    labelNode.text = text
    labelNode.fontSize = fontSize
    labelNode.fontColor = fontColor
    labelNode.position = position
    return labelNode;
}


/// Used to assign properties to the color wheel and ball (but can be used with any
/// SKSpriteNode)
///
/// - Parameters:
///   - node: SKSpriteNode to assign properties too
///   - name: name to identify SKSpriteNode
///   - size: size of node
///   - position: position of node on scene
///   - zPosition: zposition of node
///   - physicsCategory: bit of node assigned from PhysicsCategories
/// - Returns: SKSpriteNode with the assigned properties. 
func createSpriteNode(node: SKSpriteNode, name: String, size: CGSize, position: CGPoint, zPosition: CGFloat, physicsCategory: UInt32 ) -> SKSpriteNode {
    let spriteNode = node
    spriteNode.name = name
    spriteNode.size = size
    spriteNode.position = position
    spriteNode.zPosition = zPosition
    spriteNode.physicsBody = SKPhysicsBody(circleOfRadius: spriteNode.size.width/2)
    spriteNode.physicsBody?.categoryBitMask = physicsCategory
    return spriteNode
}



