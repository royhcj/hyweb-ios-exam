//
//  BookPersistenceStore+Bridging.swift
//  hyweb-ios-exam
//
//  Created by Roy on 2023/9/6.
//

import Foundation

extension Book {
    init(entity: BookEntity) {
        self.init(uuid: Int(entity.uuid),
                  title: entity.title ?? "",
                  coverUrl: URL(string: entity.coverUrl ?? ""),
                  publishDate: entity.publishDate ?? "",
                  publisher: entity.publisher ?? "",
                  author: entity.author ?? "",
                  isFavorite: entity.isFavorite)
    }
}
