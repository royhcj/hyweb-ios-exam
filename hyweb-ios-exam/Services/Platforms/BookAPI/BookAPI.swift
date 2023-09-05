//
//  BookAPI+Books.swift
//  hyweb-ios-exam
//
//  Created by Roy on 2023/9/6.
//

import Foundation
import IORequestable

class BookAPI {
    struct FetchBooks:BookAPIBase {
        var spec = Spec(.get, "user-list")
        
        typealias Input = NoParameters
        
        typealias Output = [Models.Book]
    }
    
    // Helper Type Definitions
    struct NoParameters: Encodable {
    }

    struct EmptyResponse: Decodable {
    }
}



