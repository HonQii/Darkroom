//
//  MaskColorCraft.swift
//  Darkroom
//
//  Created by HonQi on 2020/5/31.
//  Copyright © 2020 HonQi. All rights reserved.
//

import Foundation
import CoreGraphics

public struct MaskColorCraft: DarkroomCraft {
    let color: DarkroomColor
    
    init(_ color: DarkroomColor) {
        self.color = color
    }
    
    public func process(_ image: DarkroomImage) -> DarkroomImage? {
        return image
    }
}
