//
//  ViewController.swift
//  SampleGestures
//
//  Created by Nono Martínez Alonso on 9/7/15.
//  Copyright (c) 2015 Nono Martínez Alonso. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var NumberLabel: UILabel!
    
    var pinchScale : CGFloat = 1
    
    var currentScale : CGFloat = 1 {
        didSet {
            currentScale = min(max(currentScale, 1), 255)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setBackgroundColorWithScale(1)
        let pinchRecognizer : UIGestureRecognizer = UIPinchGestureRecognizer(target: self, action: "pinch:")
        self.view.addGestureRecognizer(pinchRecognizer)
    }

    func pinch(gesture: UIPinchGestureRecognizer) {
        switch gesture.state {
        case .Changed:
            self.setBackgroundColorWithScale(gesture.scale)
        case .Ended:
            println("Pinch ended.")
            pinchScale = currentScale
        default: break
        }
    }
    
    func setBackgroundColorWithScale(scale: CGFloat) {
        currentScale = pinchScale * scale
        println("Pinch changed. Scale is \(currentScale)")
        self.view.backgroundColor = UIColor(red: currentScale/255, green: currentScale/255, blue: currentScale/255, alpha: 1)
        NumberLabel.text = "\(Int(currentScale))"
    }

}

