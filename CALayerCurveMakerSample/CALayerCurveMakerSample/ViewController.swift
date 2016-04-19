//
//  ViewController.swift
//  CALayerCurveMakerSample
//
//  Created by litt1e-p on 16/4/16.
//  Copyright © 2016年 litt1e-p. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let c             = UIColor.yellowColor()
        let o: CGFloat    = 15.0
        let v             = UIView(frame:CGRectMake(30, 40, 200, 100))
        v.backgroundColor = UIColor.greenColor()
        v.center          = view.center
        view.addSubview(v)
        
        v.layer.makeCurve(o, position: .CurvePositionLeft, direction: .CurveDirectionOutside, color: c)
        v.layer.makeCurve(o, position: .CurvePositionLeft, direction: .CurveDirectionInside, color: c)
        
        v.layer.makeCurve(o, position: .CurvePositionTop, direction: .CurveDirectionOutside, color: c)
        v.layer.makeCurve(o, position: .CurvePositionTop, direction: .CurveDirectionInside, color: c)
        
        v.layer.makeCurve(o, position: .CurvePositionBottom, direction: .CurveDirectionOutside, color: c)
        v.layer.makeCurve(o, position: .CurvePositionBottom, direction: .CurveDirectionInside, color: c)
        
        v.layer.makeCurve(o, position: .CurvePositionRight, direction: .CurveDirectionOutside, color: c)
        v.layer.makeCurve(o, position: .CurvePositionRight, direction: .CurveDirectionInside, color: c)
    }
}

