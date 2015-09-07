//
//  ViewController.swift
//  SampleProtocol
//
//  Created by Nono Martínez Alonso on 9/7/15.
//  Copyright (c) 2015 Nono Martínez Alonso. All rights reserved.
//

import UIKit

class ViewController: UIViewController, CustomViewDataSource /* ★ ViewController adopts the CustomViewDataSource protocol*/ {
    
    var myView : CustomView!
    var x : CGFloat = 2.0
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        // View Setup
        let screenSize: CGRect = UIScreen.mainScreen().bounds
        let margin: CGFloat = 15
        
        // CustomView Setup
        myView = CustomView()
        myView.frame = CGRectMake(margin, margin, screenSize.width - margin*2, screenSize.height - margin*2)
        myView.backgroundColor = UIColor.clearColor()
        myView.dataSource = self; // ★ Define ViewController (self) as CustomView's dataSource
        self.view.addSubview(myView)
    }
    
    // ★ Implementation of protocol's method
    
    func thicknessForCustomView(sender: CustomView) -> CGFloat? {
        return x
    }
    
    override func touchesMoved(touches: Set<NSObject>, withEvent event: UIEvent) {
        let touchPoint = (touches.first as! UITouch).locationInView(self.view)
        x = touchPoint.x * 0.01
        myView.setNeedsDisplay()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}
