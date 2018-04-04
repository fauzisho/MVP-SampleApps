//
//  ApiResponse.swift
//  SimpleMVP
//
//  Created by UziApel on 03/04/18.
//  Copyright © 2018 UziEngine. All rights reserved.
//

import Foundation
import Foundation
import SwiftyJSON


public enum RequestResult<T>{
    case done(T)
    case failed(message: String)
}

public enum RequestProgressResult<T>{
    case done(T)
    case emailNeeded()
    case failed(message: String)
    case onProgress(progress: Double)
}

class APIError {
    var message: String = ""
    typealias BuilderClosure = (APIError) -> ()
    init(buildError: BuilderClosure) {
        buildError(self)
    }
    
}

struct ApiErrorResponse {
    static func processAPIFailed(data: Any) -> APIError {
        let dataJSON = JSON(data)
        let errorMessage = dataJSON["error"]["message"].stringValue
        let error = dataJSON["error"].stringValue
        let message = (errorMessage.isEmpty) ? error : errorMessage
        let result = APIError { api in
            api.message = (message.isEmpty) ? "Cannot process your request. Please try again later." : message
        }
        
        return result
    }
    
}
