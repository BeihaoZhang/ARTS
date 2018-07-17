//
//  HTTPTask.swift
//  NetworkLayer
//
//  Created by Lincoln on 2018/7/17.
//  Copyright © 2018年 Lincoln. All rights reserved.
//

import Foundation

public typealias HTTPHeaders = [String: String]

public enum HTTPTask {
    case request
    
    case requestParameters(bodyParameters: Parameters?,
                           urlParameters: Parameters?)
    
    case requestParametersAndHeaders(bodyParameters: Parameters?,
                                     urlParameters: Parameters?,
                                     additionHeaders: HTTPHeaders?)
    
    // case download, upload...etc
}
