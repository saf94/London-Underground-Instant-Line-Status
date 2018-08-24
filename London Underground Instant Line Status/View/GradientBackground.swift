//
//  GradientBackground.swift
//  London Underground Instant Line Status
//
//  Created by Safeer Hayat on 14/08/2018.
//  Copyright © 2018 Safeer Hayat. All rights reserved.
//

import UIKit

class GradientBackground: UIView {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    var gradientLayer: CAGradientLayer!
    
    init(frame: CGRect, gradientInitialColour: UIColor) {
        super.init(frame: frame)
        
        let gradientEndColour = gradientInitialColour.withAlphaComponent(0.3)
        gradientLayer = CAGradientLayer()
        gradientLayer.frame = frame
        gradientLayer.locations = [0.3, 1.0]
        gradientLayer.colors = [gradientInitialColour.withAlphaComponent(0.8).cgColor, gradientEndColour.cgColor]
        self.layer.addSublayer(gradientLayer)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
