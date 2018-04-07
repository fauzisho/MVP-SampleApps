//
//  CarDetailVC.swift
//  SimpleMVP
//
//  Created by UziApel on 04/04/18.
//  Copyright © 2018 UziEngine. All rights reserved.
//

import UIKit

class CarDetailVC: UIViewController {
    var car : Car!
   
    @IBOutlet weak var modelLabel: UILabel!
    @IBOutlet weak var yearLabel: UILabel!
    @IBOutlet weak var makeLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        modelLabel.text = "Model : \(car.model)"
        yearLabel.text = "Year : \(car.year)"
        makeLabel.text = "Make : \(car.make)"
    }
}
