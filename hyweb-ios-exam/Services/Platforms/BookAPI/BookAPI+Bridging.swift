//
//  BookAPI+Bridging.swift
//  hyweb-ios-exam
//
//  Created by Roy on 2023/9/6.
//

import Foundation

extension Book {
    init(with data: BookAPI.Models.Book) {
        self.init(uuid: data.uuid,
                  title: data.title,
                  coverUrl: URL(string: data.coverUrl),
                  publishDate: data.publishDate,
                  publisher: data.publisher,
                  author: data.author,
                  isFavorite: nil)
    }
}
