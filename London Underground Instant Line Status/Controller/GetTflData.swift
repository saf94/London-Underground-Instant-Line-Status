//
//  GetTflData.swift
//  London Underground Instant Line Status
//
//  Created by Safeer Hayat on 15/08/2018.
//  Copyright © 2018 Safeer Hayat. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class GetTflData {
    
    static let APP_ID = "d90c8f38"
    static let API_KEY = "0914a79d60611a74771962b177ce4785"
    static let urlEndpoint = "https://api.tfl.gov.uk/line/mode/tube/status"
    static var didApiSucceed : Bool? = nil
    static var lineStatusObject = LineStatusModel()
    
    static func getTubeStatusData(completionHandler: @escaping () -> Void) {
        didApiSucceed = nil
        Alamofire.request(urlEndpoint, method: .get).responseJSON {
            response in
            if response.result.isSuccess {
                print("Success!")
                didApiSucceed = true
                
                let lineStatus : JSON = JSON(response.result.value!)
                
                self.lineStatusObject.Bakerloo.lineName = lineStatus[0]["name"].stringValue
                self.lineStatusObject.Bakerloo.lineStatus = lineStatus[0]["lineStatuses"][0]["statusSeverityDescription"].stringValue
                if lineStatus[0]["lineStatuses"][0]["disruption"]["description"].stringValue != "null" {
                    self.lineStatusObject.Bakerloo.lineDescription = lineStatus[0]["lineStatuses"][0]["disruption"]["description"].stringValue
                } else {
                    self.lineStatusObject.Bakerloo.lineDescription = ""
                }
                
                self.lineStatusObject.Central.lineName = lineStatus[1]["name"].stringValue
                self.lineStatusObject.Central.lineStatus = lineStatus[1]["lineStatuses"][0]["statusSeverityDescription"].stringValue
                if lineStatus[1]["lineStatuses"][0]["disruption"]["description"].stringValue != "null" {
                    self.lineStatusObject.Central.lineDescription = lineStatus[1]["lineStatuses"][0]["disruption"]["description"].stringValue
                } else {
                    self.lineStatusObject.Central.lineDescription = ""
                }
                
                self.lineStatusObject.Circle.lineName = lineStatus[2]["name"].stringValue
                self.lineStatusObject.Circle.lineStatus = lineStatus[2]["lineStatuses"][0]["statusSeverityDescription"].stringValue
                if lineStatus[2]["lineStatuses"][0]["disruption"]["description"].stringValue != "null" {
                    self.lineStatusObject.Circle.lineDescription = lineStatus[2]["lineStatuses"][0]["disruption"]["description"].stringValue
                } else {
                    self.lineStatusObject.Circle.lineDescription = ""
                }
                
                self.lineStatusObject.District.lineName = lineStatus[3]["name"].stringValue
                self.lineStatusObject.District.lineStatus = lineStatus[3]["lineStatuses"][0]["statusSeverityDescription"].stringValue
                if lineStatus[3]["lineStatuses"][0]["disruption"]["description"].stringValue != "null" {
                    self.lineStatusObject.District.lineDescription = lineStatus[3]["lineStatuses"][0]["disruption"]["description"].stringValue
                } else {
                    self.lineStatusObject.District.lineDescription = ""
                }
                
                self.lineStatusObject.HammersmithAndCity.lineName = lineStatus[4]["name"].stringValue
                self.lineStatusObject.HammersmithAndCity.lineStatus = lineStatus[4]["lineStatuses"][0]["statusSeverityDescription"].stringValue
                if lineStatus[4]["lineStatuses"][0]["disruption"]["description"].stringValue != "null" {
                    self.lineStatusObject.HammersmithAndCity.lineDescription = lineStatus[4]["lineStatuses"][0]["disruption"]["description"].stringValue
                } else {
                    self.lineStatusObject.HammersmithAndCity.lineDescription = ""
                }
                
                self.lineStatusObject.Jubilee.lineName = lineStatus[5]["name"].stringValue
                self.lineStatusObject.Jubilee.lineStatus = lineStatus[5]["lineStatuses"][0]["statusSeverityDescription"].stringValue
                if lineStatus[5]["lineStatuses"][0]["disruption"]["description"].stringValue != "null" {
                    self.lineStatusObject.Jubilee.lineDescription = lineStatus[5]["lineStatuses"][0]["disruption"]["description"].stringValue
                } else {
                    self.lineStatusObject.Jubilee.lineDescription = ""
                }
                
                self.lineStatusObject.Metropolitan.lineName = lineStatus[6]["name"].stringValue
                self.lineStatusObject.Metropolitan.lineStatus = lineStatus[6]["lineStatuses"][0]["statusSeverityDescription"].stringValue
                if lineStatus[6]["lineStatuses"][0]["disruption"]["description"].stringValue != "null" {
                    self.lineStatusObject.Metropolitan.lineDescription = lineStatus[6]["lineStatuses"][0]["disruption"]["description"].stringValue
                } else {
                    self.lineStatusObject.Metropolitan.lineDescription = ""
                }
                
                self.lineStatusObject.Northern.lineName = lineStatus[7]["name"].stringValue
                self.lineStatusObject.Northern.lineStatus = lineStatus[7]["lineStatuses"][0]["statusSeverityDescription"].stringValue
                if lineStatus[7]["lineStatuses"][0]["disruption"]["description"].stringValue != "null" {
                    self.lineStatusObject.Northern.lineDescription = lineStatus[7]["lineStatuses"][0]["disruption"]["description"].stringValue
                } else {
                    self.lineStatusObject.Northern.lineDescription = ""
                }
                
                self.lineStatusObject.Piccadilly.lineName = lineStatus[8]["name"].stringValue
                self.lineStatusObject.Piccadilly.lineStatus = lineStatus[8]["lineStatuses"][0]["statusSeverityDescription"].stringValue
                if lineStatus[8]["lineStatuses"][0]["disruption"]["description"].stringValue != "null" {
                    self.lineStatusObject.Piccadilly.lineDescription = lineStatus[8]["lineStatuses"][0]["disruption"]["description"].stringValue
                } else {
                    self.lineStatusObject.Piccadilly.lineDescription = ""
                }
                
                self.lineStatusObject.Victoria.lineName = lineStatus[9]["name"].stringValue
                self.lineStatusObject.Victoria.lineStatus = lineStatus[9]["lineStatuses"][0]["statusSeverityDescription"].stringValue
                if lineStatus[9]["lineStatuses"][0]["disruption"]["description"].stringValue != "null" {
                    self.lineStatusObject.Victoria.lineDescription = lineStatus[9]["lineStatuses"][0]["disruption"]["description"].stringValue
                } else {
                    self.lineStatusObject.Victoria.lineDescription = ""
                }
                
                self.lineStatusObject.WaterlooAndCity.lineName = lineStatus[10]["name"].stringValue
                self.lineStatusObject.WaterlooAndCity.lineStatus = lineStatus[10]["lineStatuses"][0]["statusSeverityDescription"].stringValue
                if lineStatus[10]["lineStatuses"][0]["disruption"]["description"].stringValue != "null" {
                    self.lineStatusObject.WaterlooAndCity.lineDescription = lineStatus[10]["lineStatuses"][0]["disruption"]["description"].stringValue
                } else {
                    self.lineStatusObject.WaterlooAndCity.lineDescription = ""
                }
                
                completionHandler()
                
            } else {
                didApiSucceed = false
            }
        }
    }
    
}
