//
//  CustomView.swift
//  SampleProtocol
//
//  Created by Nono Martínez Alonso on 9/7/15.
//  Copyright (c) 2015 Nono Martínez Alonso. All rights reserved.
//

import UIKit

protocol CustomViewDataSource: class {
    func thicknessForCustomView(sender: CustomView) -> CGFloat? // Optional just in case the dataSource can't return the thickness
}

@IBDesignable

class CustomView: UIView {
    
    weak var dataSource: CustomViewDataSource? // Set to weak
    
    override func drawRect(rect: CGRect) {
        
        let context = UIGraphicsGetCurrentContext()
        var thickness = dataSource?.thicknessForCustomView(self) ?? 2.0
        var margin : CGFloat = 15
        
        CGContextSetLineWidth(context, thickness)
        CGContextAddEllipseInRect(context, CGRectMake(margin, margin, self.frame.width - margin*2, self.frame.height - margin*2))
        CGContextStrokePath(context)
    }
    
}
