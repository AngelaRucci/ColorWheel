//
//  Settings.swift
//  ColorWheel
//
//  Created by Angela Rucci on 7/6/18.
//  Copyright © 2018 Angela Rucci. All rights reserved.
//

import SpriteKit

// Used for indexing nodes and understanding which node was hit
enum PhysicsCategories{
    static let none: UInt32 = 0
    static let ballCategory: UInt32 = 0x1
    static let switchCategory: UInt32 = 0x1 << 1
}

// Adding Z positions for ball, label and switch
// this sends label to back, then ball infront of label,
// and colorSwitch in front of ball
enum ZPostions{
    static let label: CGFloat = 0
    static let ball: CGFloat = 1
    static let colorSwitch: CGFloat = 2
    
}

/// Colors for the ball
enum GameColors{
    static let colors = [
        UIColor(red: 191/255, green: 83/255,  blue: 80/255,  alpha: 1.0),
        UIColor(red: 254/255, green: 109/255, blue: 104/255, alpha: 1.0),
        UIColor(red: 254/255, green: 200/255, blue: 66/255,  alpha: 1.0),
        UIColor(red: 0/255,   green: 149/255, blue: 56/255,  alpha: 1.0),
        UIColor(red: 93/255,  green: 150/255, blue: 219/255, alpha: 1.0),
        UIColor(red: 0/255,   green: 113/255, blue: 207/255, alpha: 1.0)
    ]
}

/// Colors of the color switch
///
/// - maroon: R:191 G:83 B:80
/// - pink: R:254 G:109 B:104
/// - yellow: R:254 G:200 B:66
/// - green: R:0 G:149 B:56
/// - blue: R:93 G:150 B:219
/// - navy: R:0 G:113 B:207
enum SwitchState: Int{
    case maroon, pink, yellow, green, blue, navy
}


/// Layout of APP 
enum Layout {
    static let backgroundColor = UIColor(red: 15/255, green: 38/255, blue: 62/255, alpha: 1.0)
    static let font: String = "AppleSDGothicNeo-Regular"
}
