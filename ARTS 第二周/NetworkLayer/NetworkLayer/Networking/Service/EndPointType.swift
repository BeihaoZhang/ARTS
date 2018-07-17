//
//  EndPointType.swift
//  NetworkLayer
//
//  Created by Lincoln on 2018/7/17.
//  Copyright © 2018年 Lincoln. All rights reserved.
//

import Foundation

protocol EndPointType {
    var baseURL: URL { get }
    var path: String { get }
    var httpMethod: HTTPMethod { get }
    var task: HTTPTask { get }
    var headers: HTTPHeaders? { get }
}


