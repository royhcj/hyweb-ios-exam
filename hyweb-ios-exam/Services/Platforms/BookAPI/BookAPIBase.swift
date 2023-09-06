//
//  BookAPIBase.swift
//  hyweb-ios-exam
//
//  Created by Roy on 2023/9/6.
//

import Foundation
import IORequestable
import Moya

protocol BookAPIBase: MoyaIORequestable, APICachePolicyProvider {}
extension BookAPIBase {
    var baseURL: URL {
        return URL(string: "https://mservice.ebook.hyread.com.tw/exam")!
    }
    
    var headers: [String : String]? {
        return ["Accept": "application/json"]
    }
    
    public static var provider: MoyaProvider<Self> {
        return MoyaProvider<Self>(plugins: [APICachePolicyPlugin()])
    }
}

protocol APICachePolicyProvider {
    var cachePolicy: URLRequest.CachePolicy { get }
}
extension APICachePolicyProvider {
    var cachePolicy: URLRequest.CachePolicy {
        return .reloadIgnoringLocalCacheData
    }
}

final class APICachePolicyPlugin: PluginType {
    func prepare(_ request: URLRequest, target: TargetType) -> URLRequest {
        if let target = target as? APICachePolicyProvider {
            var mutableRequest = request
            mutableRequest.cachePolicy = target.cachePolicy
            return mutableRequest
        } else {
            return request
        }
    }
}

