//
//  LineStatusModel.swift
//  London Underground Instant Line Status
//
//  Created by Safeer Hayat on 11/08/2018.
//  Copyright © 2018 Safeer Hayat. All rights reserved.
//

import Foundation

class LineStatusModel {
    var Bakerloo = LineDetails(line: "", status: "", description: "")
    var Central = LineDetails(line: "", status: "", description: "")
    var Circle = LineDetails(line: "", status: "", description: "")
    var District = LineDetails(line: "", status: "", description: "")
    var HammersmithAndCity = LineDetails(line: "", status: "", description: "")
    var Jubilee = LineDetails(line: "", status: "", description: "")
    var Metropolitan = LineDetails(line: "", status: "", description: "")
    var Northern = LineDetails(line: "", status: "", description: "")
    var Piccadilly = LineDetails(line: "", status: "", description: "")
    var Victoria = LineDetails(line: "", status: "", description: "")
    var WaterlooAndCity = LineDetails(line: "", status: "", description: "")
}

class LineDetails {
    var lineName : String
    var lineStatus : String
    var lineDescription : String
    
    init(line: String, status: String, description: String) {
        lineName = line
        lineStatus = status
        lineDescription = description
    }
}
