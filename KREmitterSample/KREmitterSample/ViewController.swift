//
//  ViewController.swift
//  KREmitterSample
//
//  Created by user on 06/12/16.
//  Copyright © 2016 sample. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let emitterObj = KREmitterLayer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        let panGesture = UIPanGestureRecognizer(target: self, action: #selector(panGestureHandle(_:)))
        view.addGestureRecognizer(panGesture)
    }
    
    func panGestureHandle(sender:UIPanGestureRecognizer) {
        switch sender.state {
        case .Began:
            emitterObj.setEmitterCellToView(view)
            break
        case .Ended, .Cancelled, .Failed:
            emitterObj.emitterLayer.removeFromSuperlayer()
        default:
            var rect = emitterObj.emitterLayer.frame
            rect.origin = sender.locationInView(sender.view)
            emitterObj.emitterLayer.frame = rect
            emitterObj.emitterLayer.emitterPosition = CGPointZero
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // To view initially
    override func traitCollectionDidChange(previousTraitCollection: UITraitCollection?) {
        emitterObj.setEmitterCellToView(view)
        
    }


}

