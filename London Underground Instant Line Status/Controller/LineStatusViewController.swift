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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let gradientBackground = GradientBackground(frame: UIScreen.main.bounds, gradientInitialColour: lineColour)
        // Do any additional setup after loading the view.
        pageHeading.text = lineData.lineName
        lineStatusDetails.text = "\(lineData.lineName): \(lineData.lineStatus) \(lineData.lineDescription)"
        self.view.insertSubview(gradientBackground, at: 1)
        addTubeLineShape()
        addTubeStopShape()
        
        if defaults.string(forKey: "PreferredLineData") == lineData.lineName {
            self.linePreferenceButton.isHidden = true
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
        self.linePreferenceButton.isHidden = true
        
    }
    
    func addTubeLineShape() {
        let tubeLineLayer = CAShapeLayer()
        tubeLineLayer.path = UIBezierPath(rect: CGRect(x: 40, y: 0, width: 15, height: UIScreen.main.bounds.height)).cgPath
        tubeLineLayer.fillColor = lineColour.cgColor
        view.layer.addSublayer(tubeLineLayer)
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
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
