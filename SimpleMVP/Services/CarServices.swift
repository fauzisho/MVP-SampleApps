//
//  CarServices.swift
//  SimpleMVP
//
//  Created by UziApel on 03/04/18.
//  Copyright © 2018 UziEngine. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class CarService{
    var BaseUrl : String = "http://yuana.dev.php.or.id/slim/public/"
    
    func getCars(completion: @escaping (_ result: RequestResult<[Car]>)-> Void){
        Alamofire.request("\(BaseUrl)cars").responseJSON { (response) in
            if let result = response.result.value {
                let json = JSON(result)
                print("jsonnya:\(json)")
                var listcar = [Car]()
                let status = json["status"].stringValue
                if status == "success"{
                    let cars = json["data"].arrayValue
                    for car in cars{
                        let data = Car(withJSON: car)
                        listcar.append(data)
                    }
                    completion(RequestResult.done(listcar))
                }else{
                    completion(RequestResult.failed(message: status))
                }
            }
        }
    }
    
    func pushCar(year : String ,make : String, model :String ,completion: @escaping (_ result: RequestResult<String>)-> Void){
        let param = [
            "year": year,
            "make": make,
            "model": model
            ] as [String : Any]
        Alamofire.request("\(BaseUrl)/cars", method: .post, parameters: param)
            .responseJSON { (response) in
                if let result = response.result.value{
                    let json = JSON(result)
                    let status = json["status"].stringValue
                    if status == "success"{
                        completion(RequestResult.done(status))
                    }else{
                        completion(RequestResult.failed(message: status))
                    }
                }
        }
        
    }
    func getCars(id : Int ,completion: @escaping (_ result: RequestResult<String>)-> Void){
        Alamofire.request("\(BaseUrl)cars/\(id)", method: .delete)
        .responseJSON { (response) in
            if let result = response.result.value{
                let json = JSON(result)
                print("jsondelete:\(json)")
                let status = json["status"].stringValue
                if status == "success"{
                    completion(RequestResult.done(status))
                }else{
                    completion(RequestResult.failed(message: status))
                }
            }
        }
    }
}
