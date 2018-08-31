//
//  LinePageDecorationShapes.swift
//  
//
//  Created by Safeer Hayat on 31/08/2018.
//

import UIKit

class LinePageDecorationShapes: UIView {
    
    
    func addTubeLineShape() {
        
        let tubeLineLayer = CAShapeLayer()
        let deviceHeight = UIScreen.main.bounds.height
        
        //        print("safeAreaHeight", topPadding)
        //        print("deviceHeight", deviceHeight)
        
        tubeLineLayer.path = UIBezierPath(rect: CGRect(x: 40, y:0, width: 15, height: deviceHeight - buttomButtonsContainer.frame.height)).cgPath
        tubeLineLayer.fillColor = lineColour.cgColor
        view.layer.addSublayer(tubeLineLayer)
        
        //        if #available(iOS 11, *) {
        //            let guide = view.safeAreaLayoutGuide
        //            NSLayoutConstraint.activate([
        //                tubeLineLayer.topAnchor.constraintEqualToSystemSpacingBelow(guide.topAnchor, multiplier: 1.0),
        //                guide.bottomAnchor.constraintEqualToSystemSpacingBelow(tubeLineLayer.bottomAnchor, multiplier: 1.0)
        //                ])
        //        }
    }
    
    func addTubeStopShape() {
        let outerTubeStopLayer = CAShapeLayer()
        outerTubeStopLayer.path = UIBezierPath(ovalIn: CGRect(x: 40 - 27 + 7.5, y: 167 - 27, width: 54, height:54)).cgPath
        outerTubeStopLayer.fillColor = UIColor.black.cgColor
        view.layer.addSublayer(outerTubeStopLayer)
        
        let innerTubeStopLayer = CAShapeLayer()
        innerTubeStopLayer.path = UIBezierPath(ovalIn: CGRect(x: 40 - 20 + 7.5, y: 167 - 20, width: 40, height:40)).cgPath
        innerTubeStopLayer.fillColor = UIColor(white: 1, alpha: 1).cgColor
        view.layer.addSublayer(innerTubeStopLayer)
    }

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
    
}
