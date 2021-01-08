//
//  DarkroomEngine.swift
//  Darkroom
//
//  Created by HonQi on 2020/5/31.
//  Copyright © 2020 HonQi. All rights reserved.
//

import Foundation

open class DarkroomEngine {
    private var image: DarkroomImage?
    
    init(_ image: DarkroomImage) {
        self.image = image
    }
    
    public func process(_ crafts: DarkroomCraft) -> DarkroomImage? {
        return image
    }
}
