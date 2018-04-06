//
//  AddCarPresenter.swift
//  SimpleMVP
//
//  Created by UziApel on 06/04/18.
//  Copyright © 2018 UziEngine. All rights reserved.
//

import Foundation

protocol AddCarView{
    func displayLoading(message: String)
    func dismissLoading()
    func successAddCar()
    func showFailed(message: String)
}

class AddCarPresenter {
    private let service : CarService
    private var viewAddCar : AddCarView?
    init() {
        self.service = CarService()
    }
    
    func attachView(view : AddCarView){
        viewAddCar = view
    }
    
    func detachView() {
        viewAddCar = nil
    }
    
    func pushCar(year : String ,make : String, model :String){
        service.pushCar(year: year, make: make, model: model) { (response) in
            switch response{
            case.done(value: let result):
                self.viewAddCar?.successAddCar()
                break
            case.failed(let message):
                self.viewAddCar?.showFailed(message: message)
                break
            }
        }
    }
}
