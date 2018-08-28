//
//  ViewController.swift
//  London Underground Instant Line Status
//
//  Created by Safeer Hayat on 11/08/2018.
//  Copyright © 2018 Safeer Hayat. All rights reserved.
//

import UIKit
import UserNotifications

class ViewController: UIViewController {
    
    /*
     
     What does the app do:
        The app is to help people easily know what the status of their line is before they leave for work or leave for home. It will work by getting line status info from TFL open api. Users will choose their preferred line in the app and then the app will send local notifications at set times (e.g. 8am) to let them know the status of their line
     
     To do:
        Save your line and assign that to the content of the notification
        Segue into that line when notification is pressed and pass in data to show
        Let user choose time to schedule notification
        Set up app to regularly refresh data in the background (even if app isnt open)
     
     Main Issues:
        1) Trying to save user's preferred line as a string and using that string to get data for that line from the tflData class instance and adding the line status to the body of the notification. Currently body doesn't show anything, unsure why this is
     
        2) After user taps on notification it opens app and segues to their line, but data isnt passed through the segue to the next viewcontroller so the data to show the line status doesn't exist and the viewcontroller is blank with no data
     */
    
    @IBOutlet weak var bakerlooLineButton: UIButton!
    @IBOutlet weak var centralLineButton: UIButton!
    @IBOutlet weak var circleLineButton: UIButton!
    @IBOutlet weak var districtLineButton: UIButton!
    @IBOutlet weak var hammersmithAndCityLineButton: UIButton!
    @IBOutlet weak var jubileeLineButton: UIButton!
    @IBOutlet weak var metropolitanLineButton: UIButton!
    @IBOutlet weak var northernLineButton: UIButton!
    @IBOutlet weak var piccadillyLineButton: UIButton!
    @IBOutlet weak var victoriaLineButton: UIButton!
    @IBOutlet weak var waterlooAndCityLineButton: UIButton!
    
    //variable to track whether have arrived here from tapping notification and in that case should segue straight to the lineStatus viewcontroller
    var toSegueStraightToLine : String = ""
    let getTflData = GetTflData()
    let defaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

        //ISSUE 2) - Tried to write a closure because i thought the data wasn't being passed into the segue as maybe it hadn't loaded it from the API yet? However this closure doesnt work and the body of the closure doesn't run?
        
        getTflData.getTubeStatusData() { () in
            let data = self.getTflData.lineStatusObject
            print("lineStatusObject", data.Central.lineStatus)
            self.scheduleNotifications()
        }
        addStylingToButton()
        
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        if toSegueStraightToLine == "Yes" {
            //segueing to bakerloo line only just for testing, should segue to the users saved preferred line
            let preferredLine = defaults.string(forKey: "PreferredLineData")!.lowercased()
            performSegue(withIdentifier: "\(preferredLine)LinePage", sender: self)
            toSegueStraightToLine = ""
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func addStylingToButton() {
        let arrayOfButton = [bakerlooLineButton, centralLineButton, circleLineButton, districtLineButton, hammersmithAndCityLineButton, jubileeLineButton, metropolitanLineButton, northernLineButton, piccadillyLineButton, victoriaLineButton, waterlooAndCityLineButton]
        
        for button in arrayOfButton {
            button!.layer.borderWidth = 1
            button!.layer.cornerRadius = 5
            button!.layer.borderColor = UIColor(white: 1.0, alpha: 0).cgColor
        }
        
    }
    
    //ISSUE 1) - Am using the saved string of the users line preference to assign the line status to the notification content body but it doesn't show up in the notification pop up, not sure why
    func scheduleNotifications() {
        let preferredLine = defaults.string(forKey: "PreferredLineData")!
        let content = UNMutableNotificationContent()
        
        switch preferredLine {
        case "Bakerloo":
            content.title = "Bakerloo Line Status"
            content.body = getTflData.lineStatusObject.Bakerloo.lineStatus
        case "Central":
            content.title = "Central Line Status"
            content.body = getTflData.lineStatusObject.Central.lineStatus
        case "Circle":
            content.title = "Circle Line Status"
            content.body = getTflData.lineStatusObject.Circle.lineStatus
        case "District":
            content.title = "District Line Status"
            content.body = getTflData.lineStatusObject.District.lineStatus
        case "HammersmithAndCity":
            content.title = "Hammersmith & City Line Status"
            content.body = getTflData.lineStatusObject.HammersmithAndCity.lineStatus
        case "Jubilee":
            content.title = "Jubilee Line Status"
            content.body = getTflData.lineStatusObject.Jubilee.lineStatus
        case "Metropolitan":
            content.title = "Metropolitan Line Status"
            content.body = getTflData.lineStatusObject.Metropolitan.lineStatus
        case "Northern":
            content.title = "Northern Line Status"
            content.body = getTflData.lineStatusObject.Northern.lineStatus
        case "Piccadilly":
            content.title = "Piccadilly Line Status"
            content.body = getTflData.lineStatusObject.Piccadilly.lineStatus
        case "Victoria":
            content.title = "Victoria Line Status"
            content.body = getTflData.lineStatusObject.Victoria.lineStatus
        case "WaterlooAndCity":
            content.title = "Waterloo & City Line Status"
            content.body = getTflData.lineStatusObject.WaterlooAndCity.lineStatus
        default:
            print("Some other character")
            return
        }
        
        content.sound = UNNotificationSound.default()
        
        //notification runs after 5 seconds of view loading, this is for testing purposes - would actually run once or twice a day at a set time
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5.0, repeats: false)
        let request = UNNotificationRequest(identifier: "lineStatusUpdate", content: content, trigger: trigger)
        
        UNUserNotificationCenter.current().add(request) { (error) in
            print(error as Any)
        }
    }
    
    @IBAction func lineStatusButtons(_ sender: UIButton) {

        switch sender.tag {
        case 0:
            performSegue(withIdentifier: "bakerlooLinePage", sender: self)
        case 1:
            performSegue(withIdentifier: "centralLinePage", sender: self)
        case 2:
            performSegue(withIdentifier: "circleLinePage", sender: self)
        case 3:
            performSegue(withIdentifier: "districtLinePage", sender: self)
        case 4:
            performSegue(withIdentifier: "hammersmithAndCityLinePage", sender: self)
        case 5:
            performSegue(withIdentifier: "jubileeLinePage", sender: self)
        case 6:
            performSegue(withIdentifier: "metropolitanLinePage", sender: self)
        case 7:
            performSegue(withIdentifier: "northernLinePage", sender: self)
        case 8:
            performSegue(withIdentifier: "piccadillyLinePage", sender: self)
        case 9:
            performSegue(withIdentifier: "victoriaLinePage", sender: self)
        case 10:
            performSegue(withIdentifier: "waterlooAndCityLinePage", sender: self)
        default:
            print("Some other character")
            return
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let lineStatusObject = getTflData.lineStatusObject
        if segue.identifier == "bakerlooLinePage" {
            let lineStatusVC = segue.destination as! LineStatusViewController
            lineStatusVC.lineData = lineStatusObject.Bakerloo
            lineStatusVC.lineColour = Colours.Bakerloo
        } else if segue.identifier == "centralLinePage" {
            let lineStatusVC = segue.destination as! LineStatusViewController
            lineStatusVC.lineData = lineStatusObject.Central
            lineStatusVC.lineColour = Colours.Central
        } else if segue.identifier == "circleLinePage" {
            let lineStatusVC = segue.destination as! LineStatusViewController
            lineStatusVC.lineData = lineStatusObject.Circle
            lineStatusVC.lineColour = Colours.Circle
        } else if segue.identifier == "districtLinePage" {
            let lineStatusVC = segue.destination as! LineStatusViewController
            lineStatusVC.lineData = lineStatusObject.District
            lineStatusVC.lineColour = Colours.District
        } else if segue.identifier == "hammersmithAndCityLinePage" {
            let lineStatusVC = segue.destination as! LineStatusViewController
            lineStatusVC.lineData = lineStatusObject.HammersmithAndCity
            lineStatusVC.lineColour = Colours.HammersmithAndCity
        } else if segue.identifier == "jubileeLinePage" {
            let lineStatusVC = segue.destination as! LineStatusViewController
            lineStatusVC.lineData = lineStatusObject.Jubilee
            lineStatusVC.lineColour = Colours.Jubilee
        } else if segue.identifier == "metropolitanLinePage" {
            let lineStatusVC = segue.destination as! LineStatusViewController
            lineStatusVC.lineData = lineStatusObject.Metropolitan
            lineStatusVC.lineColour = Colours.Metropolitan
        } else if segue.identifier == "northernLinePage" {
            let lineStatusVC = segue.destination as! LineStatusViewController
            lineStatusVC.lineData = lineStatusObject.Northern
            lineStatusVC.lineColour = Colours.Northern
        } else if segue.identifier == "piccadillyLinePage" {
            let lineStatusVC = segue.destination as! LineStatusViewController
            lineStatusVC.lineData = lineStatusObject.Piccadilly
            lineStatusVC.lineColour = Colours.Piccadilly
        } else if segue.identifier == "victoriaLinePage" {
            let lineStatusVC = segue.destination as! LineStatusViewController
            lineStatusVC.lineData = lineStatusObject.Victoria
            lineStatusVC.lineColour = Colours.Victoria
        } else if segue.identifier == "waterlooAndCityLinePage" {
            let lineStatusVC = segue.destination as! LineStatusViewController
            lineStatusVC.lineData = lineStatusObject.WaterlooAndCity
            lineStatusVC.lineColour = Colours.WaterlooAndCity
        }
    }

}

