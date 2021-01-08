//
//  Darkroom.swift
//  Darkroom
//
//  Created by HonQi on 2020/5/31.
//  Copyright © 2020 HonQi. All rights reserved.
//

#if os(macOS)
import AppKit
public typealias DarkroomImage = NSImage
public typealias DarkroomColor = NSColor
#else
import UIKit
public typealias DarkroomImage = UIImage
public typealias DarkroomColor = UIColor
#endif



public protocol DarkroomProtocol {
    associatedtype WrapperType
    var dr: WrapperType { get }
}

extension DarkroomImage: DarkroomProtocol {
    public typealias WrapperType = DarkroomEngine

    public var dr: DarkroomEngine {
        return DarkroomEngine(self)
    }
}

// https://medium.com/greedygame-engineering/ios-a-haiku-on-image-processing-using-swift-f2fe0131d476
// https://www.cnblogs.com/kenshincui/p/12181735.html
