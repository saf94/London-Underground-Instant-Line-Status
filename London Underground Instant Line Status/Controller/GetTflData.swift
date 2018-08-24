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
    
    let APP_ID = "d90c8f38"
    let API_KEY = "0914a79d60611a74771962b177ce4785"
    let urlEndpoint = "https://api.tfl.gov.uk/line/mode/tube/status"
    var lineStatusObject = LineStatusModel()

    func getTubeStatusData() {
        Alamofire.request(urlEndpoint, method: .get).responseJSON {
            response in
            if response.result.isSuccess {
                print("Success!")
                
                let lineStatus : JSON = JSON(response.result.value!)
                
                self.lineStatusObject.Bakerloo.lineName = lineStatus[0]["name"].stringValue
                self.lineStatusObject.Bakerloo.lineStatus = lineStatus[0]["lineStatuses"][0]["statusSeverityDescription"].stringValue
                if lineStatus[0]["lineStatuses"][0]["disruption"]["description"].stringValue != "null" {
                    self.lineStatusObject.Bakerloo.lineDescription = lineStatus[0]["lineStatuses"][0]["disruption"]["description"].stringValue
                    print(self.lineStatusObject.Bakerloo.lineDescription)
                } else {
                    self.lineStatusObject.Bakerloo.lineDescription = ""
                    print(self.lineStatusObject.Bakerloo.lineDescription)
                }
                
                self.lineStatusObject.Central.lineName = lineStatus[1]["name"].stringValue
                self.lineStatusObject.Central.lineStatus = lineStatus[1]["lineStatuses"][0]["statusSeverityDescription"].stringValue
                if lineStatus[1]["lineStatuses"][0]["disruption"]["description"].stringValue != "null" {
                    self.lineStatusObject.Central.lineDescription = lineStatus[1]["lineStatuses"][0]["disruption"]["description"].stringValue
                    print(self.lineStatusObject.Central.lineDescription)
                } else {
                    self.lineStatusObject.Central.lineDescription = ""
                    print(self.lineStatusObject.Central.lineDescription)
                }
                
                self.lineStatusObject.Circle.lineName = lineStatus[2]["name"].stringValue
                self.lineStatusObject.Circle.lineStatus = lineStatus[2]["lineStatuses"][0]["statusSeverityDescription"].stringValue
                if lineStatus[2]["lineStatuses"][0]["disruption"]["description"].stringValue != "null" {
                    self.lineStatusObject.Circle.lineDescription = lineStatus[2]["lineStatuses"][0]["disruption"]["description"].stringValue
                    print(self.lineStatusObject.Circle.lineDescription)
                } else {
                    self.lineStatusObject.Circle.lineDescription = ""
                    print(self.lineStatusObject.Circle.lineDescription)
                }
                
                self.lineStatusObject.District.lineName = lineStatus[3]["name"].stringValue
                self.lineStatusObject.District.lineStatus = lineStatus[3]["lineStatuses"][0]["statusSeverityDescription"].stringValue
                if lineStatus[3]["lineStatuses"][0]["disruption"]["description"].stringValue != "null" {
                    self.lineStatusObject.District.lineDescription = lineStatus[3]["lineStatuses"][0]["disruption"]["description"].stringValue
                    print(self.lineStatusObject.District.lineDescription)
                } else {
                    self.lineStatusObject.District.lineDescription = ""
                    print(self.lineStatusObject.District.lineDescription)
                }
                
                self.lineStatusObject.HammersmithAndCity.lineName = lineStatus[4]["name"].stringValue
                self.lineStatusObject.HammersmithAndCity.lineStatus = lineStatus[4]["lineStatuses"][0]["statusSeverityDescription"].stringValue
                if lineStatus[4]["lineStatuses"][0]["disruption"]["description"].stringValue != "null" {
                    self.lineStatusObject.HammersmithAndCity.lineDescription = lineStatus[4]["lineStatuses"][0]["disruption"]["description"].stringValue
                    print(self.lineStatusObject.HammersmithAndCity.lineDescription)
                } else {
                    self.lineStatusObject.HammersmithAndCity.lineDescription = ""
                    print(self.lineStatusObject.HammersmithAndCity.lineDescription)
                }
                
                self.lineStatusObject.Jubilee.lineName = lineStatus[5]["name"].stringValue
                self.lineStatusObject.Jubilee.lineStatus = lineStatus[5]["lineStatuses"][0]["statusSeverityDescription"].stringValue
                if lineStatus[5]["lineStatuses"][0]["disruption"]["description"].stringValue != "null" {
                    self.lineStatusObject.Jubilee.lineDescription = lineStatus[5]["lineStatuses"][0]["disruption"]["description"].stringValue
                    print(self.lineStatusObject.Jubilee.lineDescription)
                } else {
                    self.lineStatusObject.Jubilee.lineDescription = ""
                    print(self.lineStatusObject.Jubilee.lineDescription)
                }
                
                self.lineStatusObject.Metropolitan.lineName = lineStatus[6]["name"].stringValue
                self.lineStatusObject.Metropolitan.lineStatus = lineStatus[6]["lineStatuses"][0]["statusSeverityDescription"].stringValue
                if lineStatus[6]["lineStatuses"][0]["disruption"]["description"].stringValue != "null" {
                    self.lineStatusObject.Metropolitan.lineDescription = lineStatus[6]["lineStatuses"][0]["disruption"]["description"].stringValue
                    print(self.lineStatusObject.Metropolitan.lineDescription)
                } else {
                    self.lineStatusObject.Metropolitan.lineDescription = ""
                    print(self.lineStatusObject.Metropolitan.lineDescription)
                }
                
                self.lineStatusObject.Northern.lineName = lineStatus[7]["name"].stringValue
                self.lineStatusObject.Northern.lineStatus = lineStatus[7]["lineStatuses"][0]["statusSeverityDescription"].stringValue
                if lineStatus[7]["lineStatuses"][0]["disruption"]["description"].stringValue != "null" {
                    self.lineStatusObject.Northern.lineDescription = lineStatus[7]["lineStatuses"][0]["disruption"]["description"].stringValue
                    print(self.lineStatusObject.Northern.lineDescription)
                } else {
                    self.lineStatusObject.Northern.lineDescription = ""
                    print(self.lineStatusObject.Northern.lineDescription)
                }
                
                self.lineStatusObject.Piccadilly.lineName = lineStatus[8]["name"].stringValue
                self.lineStatusObject.Piccadilly.lineStatus = lineStatus[8]["lineStatuses"][0]["statusSeverityDescription"].stringValue
                if lineStatus[8]["lineStatuses"][0]["disruption"]["description"].stringValue != "null" {
                    self.lineStatusObject.Piccadilly.lineDescription = lineStatus[8]["lineStatuses"][0]["disruption"]["description"].stringValue
                    print(self.lineStatusObject.Piccadilly.lineDescription)
                } else {
                    self.lineStatusObject.Piccadilly.lineDescription = ""
                    print(self.lineStatusObject.Piccadilly.lineDescription)
                }
                
                self.lineStatusObject.Victoria.lineName = lineStatus[9]["name"].stringValue
                self.lineStatusObject.Victoria.lineStatus = lineStatus[9]["lineStatuses"][0]["statusSeverityDescription"].stringValue
                if lineStatus[9]["lineStatuses"][0]["disruption"]["description"].stringValue != "null" {
                    self.lineStatusObject.Victoria.lineDescription = lineStatus[9]["lineStatuses"][0]["disruption"]["description"].stringValue
                    print(self.lineStatusObject.Victoria.lineDescription)
                } else {
                    self.lineStatusObject.Victoria.lineDescription = ""
                    print(self.lineStatusObject.Victoria.lineDescription)
                }
                
                self.lineStatusObject.WaterlooAndCity.lineName = lineStatus[10]["name"].stringValue
                self.lineStatusObject.WaterlooAndCity.lineStatus = lineStatus[10]["lineStatuses"][0]["statusSeverityDescription"].stringValue
                if lineStatus[10]["lineStatuses"][0]["disruption"]["description"].stringValue != "null" {
                    self.lineStatusObject.WaterlooAndCity.lineDescription = lineStatus[10]["lineStatuses"][0]["disruption"]["description"].stringValue
                    print(self.lineStatusObject.WaterlooAndCity.lineDescription)
                } else {
                    self.lineStatusObject.WaterlooAndCity.lineDescription = ""
                    print(self.lineStatusObject.WaterlooAndCity.lineDescription)
                }
                
            }
        }
    }

}
