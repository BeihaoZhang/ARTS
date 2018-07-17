//
//  ParameterEncoder.swift
//  NetworkLayer
//
//  Created by Lincoln on 2018/7/17.
//  Copyright © 2018年 Lincoln. All rights reserved.
//

import Foundation

public typealias Parameters = [String: Any]

public enum NetworkError: String, Error {
    case parametersNil = "Parameters were nil."
    case encodingFailed = "Parameter encoding failed."
    case missingURL = "URL is nil."
}

public protocol ParameterEncoder {
    static func encode(urlRequest: inout URLRequest, with parameters: Parameters) throws
}


