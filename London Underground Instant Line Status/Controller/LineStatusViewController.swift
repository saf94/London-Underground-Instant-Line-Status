//
//  LineStatusViewController.swift
//  London Underground Instant Line Status
//
//  Created by Safeer Hayat on 13/08/2018.
//  Copyright © 2018 Safeer Hayat. All rights reserved.
//

import UIKit

class LineStatusViewController: UIViewController {

    var lineData = LineDetails(line: "", status: "", description: "")
    var lineColour = Colours.Bakerloo
    
    let defaults = UserDefaults.standard

    @IBOutlet weak var lineStatusDetails: UILabel!
    @IBOutlet weak var pageHeading: UILabel!
    @IBOutlet weak var linePreferenceButton: UIButton!
    @IBOutlet weak var bottomButtonContainer: UIView!
    @IBOutlet weak var buttomButtonsContainer: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let gradientBackground = GradientBackground(frame: UIScreen.main.bounds, gradientInitialColour: lineColour)
        let linePageShapes = LinePageDecorationShapes()
        
        pageHeading.text = lineData.lineName
        lineStatusDetails.text = "\(lineData.lineName): \(lineData.lineStatus) \(lineData.lineDescription)"
        
        self.view.insertSubview(gradientBackground, at: 1)
        self.view.insertSubview(linePageShapes, at: 1)
        bottomButtonContainer.backgroundColor = lineColour
//        addTubeLineShape()
//        addTubeStopShape()
        
        if defaults.string(forKey: "PreferredLineData") == lineData.lineName {
            self.linePreferenceButton.setTitle("Preferred Line ✓", for: .normal)
        }
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func dismissViewController(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func setLineAsPreferred(_ sender: Any) {
        self.defaults.set(lineData.lineName, forKey: "PreferredLineData")
        self.linePreferenceButton.setTitle("Preferred Line ✓", for: .normal)
        
    }
    
//    func addTubeLineShape() {
//        
//        let tubeLineLayer = CAShapeLayer()
//        let deviceHeight = UIScreen.main.bounds.height
//        
////        print("safeAreaHeight", topPadding)
////        print("deviceHeight", deviceHeight)
//        
//        tubeLineLayer.path = UIBezierPath(rect: CGRect(x: 40, y:0, width: 15, height: deviceHeight - buttomButtonsContainer.frame.height)).cgPath
//        tubeLineLayer.fillColor = lineColour.cgColor
//        view.layer.addSublayer(tubeLineLayer)
//        
////        if #available(iOS 11, *) {
////            let guide = view.safeAreaLayoutGuide
////            NSLayoutConstraint.activate([
////                tubeLineLayer.topAnchor.constraintEqualToSystemSpacingBelow(guide.topAnchor, multiplier: 1.0),
////                guide.bottomAnchor.constraintEqualToSystemSpacingBelow(tubeLineLayer.bottomAnchor, multiplier: 1.0)
////                ])
////        }
//    }
//    
//    func addTubeStopShape() {
//        let outerTubeStopLayer = CAShapeLayer()
//        outerTubeStopLayer.path = UIBezierPath(ovalIn: CGRect(x: 40 - 27 + 7.5, y: 167 - 27, width: 54, height:54)).cgPath
//        outerTubeStopLayer.fillColor = UIColor.black.cgColor
//        view.layer.addSublayer(outerTubeStopLayer)
//        
//        let innerTubeStopLayer = CAShapeLayer()
//        innerTubeStopLayer.path = UIBezierPath(ovalIn: CGRect(x: 40 - 20 + 7.5, y: 167 - 20, width: 40, height:40)).cgPath
//        innerTubeStopLayer.fillColor = UIColor(white: 1, alpha: 1).cgColor
//        view.layer.addSublayer(innerTubeStopLayer)
//    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
