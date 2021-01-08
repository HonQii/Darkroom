//
//  ResizeCraft.swift
//  Darkroom
//
//  Created by HonQi on 2020/5/31.
//  Copyright © 2020 HonQi. All rights reserved.
//

#if os(macOS)
import AppKit
#else
import UIKit
#endif


public struct ResizeCraft: DarkroomCraft {
    public enum FitMode {
        case exact
        case scaleToMin
        case scaleToMax
    }
    
    private let size: CGSize
    private let mode: FitMode
    
    init(target size: CGSize, mode: FitMode = .exact) {
        self.size = size
        self.mode = mode
    }
    
    public func process(_ image: DarkroomImage) -> DarkroomImage? {
        guard let imgRef = image.orientationCGImage else { return nil }
        
        let originalWidth  = CGFloat(imgRef.width)
        let originalHeight = CGFloat(imgRef.height)
        let widthRatio = size.width / originalWidth
        let heightRatio = size.height / originalHeight
        
        let scaleRatio = mode == .scaleToMin ? min(heightRatio, widthRatio) : max(heightRatio, widthRatio)
        let resizedImageBounds = CGRect(x: 0, y: 0, width: round(originalWidth * scaleRatio), height: round(originalHeight * scaleRatio))
        
        image.draw(in: resizedImageBounds)
        defer { UIGraphicsEndImageContext() }
        guard let resizedImage = UIGraphicsGetImageFromCurrentImageContext() else { return nil }
        
        switch (mode) {
        case .scaleToMin:
            return resizedImage
        case .scaleToMax:
            let croppedRect = CGRect(x: (resizedImage!.size.width - size.width) / 2,
                                     y: (resizedImage!.size.height - size.height) / 2,
                                     width: size.width, height: size.height)
            return Util.croppedImageWithRect(resizedImage!, rect: croppedRect)
        case .scale:
            return Util.drawImageInBounds(resizedImage!, bounds: CGRect(x: 0, y: 0, width: size.width, height: size.height))
        }
    }
}
