//
//  CarDetailVC.swift
//  SimpleMVP
//
//  Created by UziApel on 04/04/18.
//  Copyright © 2018 UziEngine. All rights reserved.
//

import UIKit

class CarDetailVC: UIViewController {
    var car : Car?
   
    override func viewDidLoad() {
        super.viewDidLoad()
        print(car?.model)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
     
    }

}
