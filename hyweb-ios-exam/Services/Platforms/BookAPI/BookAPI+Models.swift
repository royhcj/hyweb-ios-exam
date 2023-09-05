//
//  BookAPI+Models.swift
//  hyweb-ios-exam
//
//  Created by Roy on 2023/9/6.
//

import Foundation

extension BookAPI {
    class Models {
        struct Book: Decodable {
            let uuid: Int
            let title: String
            let coverUrl: String
            let publishDate: String
            let publisher: String
            let author: String
        }
    }
}
