//
//  SemiCircularBorderView.swift
//  Innovations
//
//  Created by AFSHA on 17/07/17.
//  Copyright © 2017 Afsha. All rights reserved.
//

import UIKit

class SemiCircularBorderView: UIView {

    @IBOutlet weak var centerView : UIView!
    
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
        let gc : CGContext = UIGraphicsGetCurrentContext()!
        gc.beginPath()
         
        let radius = rect.size.width/10/2
        let centerY = rect.maxY-radius
        var centerX = radius
        
        var number = 0
        while number < 10 {
            centerView.center = CGPoint.init(x: centerX, y: centerY)
            gc.addArc(center: CGPoint.init(x: centerX, y: centerY), radius: radius, startAngle: 0, endAngle: CGFloat(Double.pi), clockwise: false)
            gc.setFillColor(UIColor.cyan.cgColor)
            gc.fillPath()
            centerX += 2*radius
            number = number + 1
        }
        
        gc.clip(to: CGRect.init(x: rect.origin.x+radius, y: rect.origin.y+radius, width: rect.size.width-2*radius, height: rect.size.height-2*radius))
        gc.fill(rect)
    }


}
