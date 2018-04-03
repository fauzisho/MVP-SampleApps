//
//  Car.swift
//  SimpleMVP
//
//  Created by UziApel on 03/04/18.
//  Copyright © 2018 UziEngine. All rights reserved.
//

import Foundation
import SwiftyJSON

class Car{
    var id : Int = 0
    var year : Int = 0
    var make : String = ""
    var model : String = ""
    
    init(withJSON data: JSON) {
        self.id = data["id"].intValue
        self.year = data["year"].intValue
        self.make = data["make"].stringValue
        self.model = data["model"].stringValue
    }
}
