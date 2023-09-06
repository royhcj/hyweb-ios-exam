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

extension BookEntity {
    func update(with book: Book) {
        uuid = Int32(book.uuid)
        title = book.title
        coverUrl = book.coverUrl?.absoluteString
        publishDate = book.publishDate
        publisher = book.publisher
        author = book.author
    }
}
