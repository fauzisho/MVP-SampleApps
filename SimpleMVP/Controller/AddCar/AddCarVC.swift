//
//  AddCarVC.swift
//  SimpleMVP
//
//  Created by UziApel on 06/04/18.
//  Copyright © 2018 UziEngine. All rights reserved.
//

import UIKit

class AddCarVC: UIViewController {
    @IBOutlet weak var textModel: UITextField!
    @IBOutlet weak var textYear: UITextField!
    @IBOutlet weak var textMake: UITextField!
    @IBOutlet weak var addButton: UIButton!
    var presenter : AddCarPresenter = AddCarPresenter()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.attachView(view: self)
        addButton.addTarget(self, action: #selector(addCarTarget(_:)), for: .touchUpInside)
    }
    
    @objc func addCarTarget(_ car : UIButton){
        if textYear.text != "" && textMake.text != ""  && textMake.text != ""{
            presenter.pushCar(year: textYear.text!, make: textMake.text!, model: textModel.text!)
        }
    }
}
extension AddCarVC : AddCarView{
    func displayLoading(message: String) {
        
    }
    
    func dismissLoading() {
        
    }
    
    func successAddCar() {
        self.navigationController?.popViewController(animated: true)
    }
    
    func showFailed(message: String) {
    print("error \(message)")
    }
    
    
}

