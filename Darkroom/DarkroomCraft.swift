//
//  DarkroomCraft.swift
//  Darkroom
//
//  Created by HonQi on 2020/5/31.
//  Copyright © 2020 HonQi. All rights reserved.
//

import Foundation


public protocol DarkroomCraft {
    func process(_ image: DarkroomImage) -> DarkroomImage?
}

public enum DarkroomCrafts {
    case maskColor(DarkroomColor)
    
//    var craft: DarkroomCraft {
//        
//    }
}
