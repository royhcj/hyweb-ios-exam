//
//  Book.swift
//  hyweb-ios-exam
//
//  Created by Roy on 2023/9/5.
//

import Foundation

struct Book {
    let uuid: Int
    let title: String
    let coverUrl: URL?
    let publishDate: String
    let publisher: String
    let author: String
    var isFavorite: Bool?
}

