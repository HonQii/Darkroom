//
//  ImageExtensions.swift
//  Darkroom
//
//  Created by HonQi on 2020/5/31.
//  Copyright © 2020 HonQi. All rights reserved.
//

import CoreGraphics

internal extension DarkroomImage {
    var orientationCGImage: CGImage? {
        guard let contextImage = cgImage else { return nil }
        
        if imageOrientation == .up {
            return cgImage
        }
        
        var transform : CGAffineTransform = CGAffineTransform.identity
        
        switch imageOrientation {
        case .right, .rightMirrored:
            transform = transform.translatedBy(x: 0, y: size.height)
            transform = transform.rotated(by: .pi / -2.0)
        case .left, .leftMirrored:
            transform = transform.translatedBy(x: size.width, y: 0)
            transform = transform.rotated(by: .pi / 2.0)
        case .down, .downMirrored:
            transform = transform.translatedBy(x: size.width, y: size.height)
            transform = transform.rotated(by: .pi)
        default:
            break
        }

        switch imageOrientation {
        case .rightMirrored, .leftMirrored:
            transform = transform.translatedBy(x: size.height, y: 0)
            transform = transform.scaledBy(x: -1, y: 1)
        case .downMirrored, .upMirrored:
            transform = transform.translatedBy(x: size.width, y: 0)
            transform = transform.scaledBy(x: -1, y: 1)
        default:
            break
        }
        
        let contextWidth: Int
        let contextHeight: Int
        
        switch imageOrientation {
        case .left, .leftMirrored, .right, .rightMirrored:
            contextWidth = contextImage.height
            contextHeight = contextImage.width
            break
        default:
            contextWidth = contextImage.width
            contextHeight = contextImage.height
            break
        }
        
        guard let context = CGContext(data: nil,
                                      width: contextWidth,
                                      height: contextHeight,
                                      bitsPerComponent: contextImage.bitsPerComponent,
                                      bytesPerRow: 0,
                                      space: contextImage.colorSpace!,
                                      bitmapInfo: contextImage.bitmapInfo.rawValue) else { return nil }
        
        context.concatenate(transform)
        context.draw(contextImage, in: CGRect(x: 0, y: 0, width: CGFloat(contextWidth), height: CGFloat(contextHeight)))
        
        return context.makeImage()
    }
}
