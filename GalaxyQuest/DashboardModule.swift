//
//  DashboardModule.swift
//  GalaxyQuest
//
//  Created by Michael Selsky on 11/8/14.
//  Copyright (c) 2014 Michael Selsky. All rights reserved.
//

/*
 * Individual control that will be part of all the dashboard controls for the spaceship
 */

import UIKit

enum  DashboardControlType{
    case Switch
    case Slider
    case Button
}

class DashboardModule: NSObject {
    var type: DashboardControlType
    var name: String
    var value: Int
    var action: String

    
    init(type: DashboardControlType, name: String, action: String){
        self.type = type
        self.name = name
        self.value = 0
        self.action = action
        super.init()
    }
    
}
