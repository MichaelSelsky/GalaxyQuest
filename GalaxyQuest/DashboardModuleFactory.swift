//
//  DashboardModuleFactory.swift
//  GalaxyQuest
//
//  Created by Michael Selsky on 11/8/14.
//  Copyright (c) 2014 Michael Selsky. All rights reserved.
//

import UIKit

class DashboardModuleFactory: NSObject {
    let values = [
        ["action":"Snuggle",
            "name":"bunnies",
            "type":"button"],
        ["action":"Fire",
            "name":"potato gun",
            "type":"button"],
        ["action":"Eat",
            "name":"Soylent (tm)",
            "type":"button"]]
    
    func createModule() -> DashboardModule{
        let count = self.values.count
        let randNum = arc4random_uniform(UInt32(count))
        let dict = self.values[Int(randNum)]
        var moduleType: DashboardControlType?
        let typeString = dict["type"] as String!
        switch typeString {
        case "button":
            moduleType = .Button
        case "switch":
            moduleType = .Switch
        case "slider":
            moduleType = .Slider
        default:
            moduleType = .Button
        }
        
        return DashboardModule(type: moduleType!, name: dict["name"]!, action: dict["action"]!)
    }
}
