//
//  ListCarPresenter.swift
//  SimpleMVP
//
//  Created by UziApel on 03/04/18.
//  Copyright © 2018 UziEngine. All rights reserved.
//

import Foundation
protocol ListCarView {
    func displayLoading(message: String)
    func dismissLoading()
    func showFailed(message: String)
    func showListCar(listCar : [Car])
}

class ListCarPresenter{
    private let service : CarService!
    private var viewListCar : ListCarView?

    init() {
       self.service = CarService()
    }
    
    func attachView(view : ListCarView){
        viewListCar = view
    }
    
    func detachView() {
        viewListCar = nil
    }
    func getCars(){
        service.getCars { (response) in
            switch response{
            case.done(value: let result):
                self.viewListCar?.showListCar(listCar: result)
                break
            case .failed(let message):
                self.viewListCar?.showFailed(message: message)
                break
            }
        }
    }
}
