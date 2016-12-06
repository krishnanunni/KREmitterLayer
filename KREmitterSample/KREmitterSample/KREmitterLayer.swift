//
//  KREmitterLayer.swift
//  GuessThePet
//
//  Created by user on 05/12/16.
//  Copyright © 2016 Razeware LLC. All rights reserved.
//

import UIKit

class KREmitterLayer: NSObject {

    
    let emitterLayer = CAEmitterLayer()
    let emitterCell = CAEmitterCell()
    
    func setEmitterCellToView(view:UIView) {
        setUpEmitterLayerWithFrame(view)
        setupEmitterCell()
        emitterLayer.emitterCells = [emitterCell]
        view.layer.addSublayer(emitterLayer)
    }
    
    func setUpEmitterLayerWithFrame(view:UIView) {
        emitterLayer.frame = view.frame
        emitterLayer.seed = UInt32(NSDate().timeIntervalSince1970)
        emitterLayer.renderMode = kCAEmitterLayerAdditive
        emitterLayer.drawsAsynchronously = true
    }
    
    func setupEmitterCell() {
        emitterCell.contents = UIImage(named: "star")?.CGImage
        emitterCell.velocity = 50.0
        emitterCell.velocityRange = 1000.0
        emitterCell.color = UIColor.blackColor().CGColor
        emitterCell.redRange = 1.0
        emitterCell.greenRange = 1.0
        emitterCell.blueRange = 1.0
        emitterCell.alphaRange = 0.0
        emitterCell.redSpeed = 0.0
        emitterCell.greenSpeed = 0.0
        emitterCell.blueSpeed = 0.0
        emitterCell.alphaSpeed = -0.5
        
        let zeroDegreeInRadians = degreeToRadians(0.0)
        emitterCell.spin = degreeToRadians(130.0)
        emitterCell.spinRange = zeroDegreeInRadians
        emitterCell.emissionRange = degreeToRadians(360.0)
        
        emitterCell.lifetime = 1.0
        emitterCell.birthRate = 50.0
        emitterCell.xAcceleration = -200
        emitterCell.yAcceleration = -500.0
        
    }
    
    func degreeToRadians(degree:Double) -> CGFloat {
        return CGFloat(degree * M_PI / 180.0)
    }
}
