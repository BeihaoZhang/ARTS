//
//  NetworkRouter.swift
//  NetworkLayer
//
//  Created by Lincoln on 2018/7/17.
//  Copyright © 2018年 Lincoln. All rights reserved.
//

import Foundation

public typealias NetworkRouterCompletion = (_ data: Data?, _ response: URLResponse?, _ error: Error?) -> ()

protocol NetworkRouter: class {
    associatedtype EndPoint: EndPointType
    func request(_ route: EndPoint, completion: @escaping NetworkRouterCompletion)
    func cancel()
}
