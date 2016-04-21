//
//  CALayerCurveMaker.swift
//  CALayerCurveMaker
//
//  Created by litt1e-p on 16/4/16.
//  Copyright © 2016年 litt1e-p. All rights reserved.
//

import Foundation
import UIKit

enum CurvePosition
{
    case CurvePositionTop
    case CurvePositionLeft
    case CurvePositionBottom
    case CurvePositionRight
}

enum CurveDirection
{
    case CurveDirectionOutside
    case CurveDirectionInside
}

extension CALayer
{
    func makeCurve(offset: CGFloat, position: CurvePosition, direction: CurveDirection, color: UIColor?) {
        assert(offset >= 0, "Curve Offset value should be larger than 0")
        let shapeLayer = CAShapeLayer()
        let bezier = UIBezierPath()
        let points = bezierPoints(offset, position: position, direction: direction)
        bezier.moveToPoint(points[0])
        bezier.addLineToPoint(points[1])
        bezier.addLineToPoint(points[2])
        bezier.addLineToPoint(points[3])
        bezier.addQuadCurveToPoint(points[0], controlPoint: points[4])
        shapeLayer.path = bezier.CGPath
        shapeLayer.fillColor = color != nil ? color!.CGColor : UIColor.whiteColor().CGColor
        addSublayer(shapeLayer)
    }
    
    private func bezierPoints(offset: CGFloat, position: CurvePosition, direction: CurveDirection) -> [CGPoint] {
        var p1          = CGPointZero
        var p2          = CGPointZero
        var p3          = CGPointZero
        var p4          = CGPointZero
        var c           = CGPointZero
        let frame       = self.bounds
        let s: CGFloat  = 2.0
        let mH: CGFloat = 0.15
        
        switch position {
            
        case .CurvePositionTop:
            if (direction == .CurveDirectionInside) {
                p1 = CGPointMake(CGRectGetMinX(frame), CGRectGetMinY(frame) + mH);
                p2 = CGPointMake(CGRectGetMinX(frame), CGRectGetMinY(frame));
                p3 = CGPointMake(CGRectGetMaxX(frame), CGRectGetMinY(frame));
                p4 = CGPointMake(CGRectGetMaxX(frame), CGRectGetMinY(frame) + mH);
                c = CGPointMake(CGRectGetWidth(frame) / s, CGRectGetMinY(frame) + offset);
            } else {
                p1 = CGPointMake(CGRectGetMinX(frame), CGRectGetMinY(frame));
                p2 = CGPointMake(CGRectGetMinX(frame), CGRectGetMinY(frame) + mH);
                p3 = CGPointMake(CGRectGetMaxX(frame), CGRectGetMinY(frame) + mH);
                p4 = CGPointMake(CGRectGetMaxX(frame), CGRectGetMinY(frame));
                c = CGPointMake(CGRectGetWidth(frame) / s, CGRectGetMinY(frame) - offset);
            }
            
        case .CurvePositionLeft:
            if (direction == .CurveDirectionInside) {
                p1 = CGPointMake(CGRectGetMinX(frame) + mH, CGRectGetMinY(frame));
                p2 = CGPointMake(CGRectGetMinX(frame), CGRectGetMinY(frame));
                p3 = CGPointMake(CGRectGetMinX(frame), CGRectGetMaxY(frame));
                p4 = CGPointMake(CGRectGetMinX(frame) + mH, CGRectGetMaxY(frame));
                c = CGPointMake(CGRectGetMinX(frame) + offset, CGRectGetHeight(frame) / s);
            } else {
                p1 = CGPointMake(CGRectGetMinX(frame), CGRectGetMinY(frame));
                p2 = CGPointMake(CGRectGetMinX(frame) + mH, CGRectGetMinY(frame));
                p3 = CGPointMake(CGRectGetMinX(frame) + mH, CGRectGetMaxY(frame));
                p4 = CGPointMake(CGRectGetMinX(frame), CGRectGetMaxY(frame));
                c = CGPointMake(CGRectGetMinX(frame) - offset, CGRectGetHeight(frame) / s);
            }
            
        case .CurvePositionBottom:
            if (direction == .CurveDirectionInside) {
                p1 = CGPointMake(CGRectGetMinX(frame), CGRectGetMaxY(frame) - mH);
                p2 = CGPointMake(CGRectGetMinX(frame), CGRectGetMaxY(frame));
                p3 = CGPointMake(CGRectGetMaxX(frame), CGRectGetMaxY(frame));
                p4 = CGPointMake(CGRectGetMaxX(frame), CGRectGetMaxY(frame) - mH);
                c = CGPointMake(CGRectGetWidth(frame) / s, CGRectGetMaxY(frame) - offset);
            } else {
                p1 = CGPointMake(CGRectGetMinX(frame), CGRectGetMaxY(frame));
                p2 = CGPointMake(CGRectGetMinX(frame), CGRectGetMaxY(frame) - mH);
                p3 = CGPointMake(CGRectGetMaxX(frame), CGRectGetMaxY(frame) - mH);
                p4 = CGPointMake(CGRectGetMaxX(frame), CGRectGetMaxY(frame));
                c = CGPointMake(CGRectGetWidth(frame) / s, CGRectGetMaxY(frame) + offset);
            }
            
        case .CurvePositionRight:
            if (direction == .CurveDirectionInside) {
                p1 = CGPointMake(CGRectGetMaxX(frame) - mH, CGRectGetMinY(frame));
                p2 = CGPointMake(CGRectGetMaxX(frame), CGRectGetMinY(frame));
                p3 = CGPointMake(CGRectGetMaxX(frame), CGRectGetMaxY(frame));
                p4 = CGPointMake(CGRectGetMaxX(frame) - mH, CGRectGetMaxY(frame));
                c = CGPointMake(CGRectGetMaxX(frame) - offset, CGRectGetHeight(frame) / s);
            } else {
                p1 = CGPointMake(CGRectGetMaxX(frame), CGRectGetMinY(frame));
                p2 = CGPointMake(CGRectGetMaxX(frame) - mH, CGRectGetMinY(frame));
                p3 = CGPointMake(CGRectGetMaxX(frame) - mH, CGRectGetMaxY(frame));
                p4 = CGPointMake(CGRectGetMaxX(frame), CGRectGetMaxY(frame));
                c = CGPointMake(CGRectGetMaxX(frame) + offset, CGRectGetHeight(frame) / s);
            }
            
        }
        return [p1, p2, p3, p4, c]
    }    
}