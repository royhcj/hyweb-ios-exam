//
//  BookAPIBase.swift
//  hyweb-ios-exam
//
//  Created by Roy on 2023/9/6.
//

import Foundation
import IORequestable
import Moya

protocol BookAPIBase: MoyaIORequestable {}
extension BookAPIBase {
    var baseURL: URL {
        return URL(string: "https://mservice.ebook.hyread.com.tw/exam")!
    }
    
    var headers: [String : String]? {
        return ["Accept": "application/json"]
    }
    
    public static var provider: MoyaProvider<Self> {
        return MoyaProvider<Self>()
    }
}


