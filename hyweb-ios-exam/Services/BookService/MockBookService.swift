//
//  MockBookService.swift
//  hyweb-ios-exam
//
//  Created by Roy on 2023/9/5.
//

import Foundation

class MockBookService: BookServiceProtocol {
    static let shared = MockBookService()
    
    private init() {
    }
    
    func fetchBooks(completion: @escaping (Result<[Book], Error>) -> Void) {
        let books: [Book] = [
            .init(uuid: 1, title: "Book 1", coverUrl: nil, publishDate: "2021", publisher: "Pub 1", author: "Author 1"),
            .init(uuid: 2, title: "Book 2", coverUrl: nil, publishDate: "2021", publisher: "Pub 2", author: "Author 2"),
            .init(uuid: 3, title: "Book 3", coverUrl: nil, publishDate: "2021", publisher: "Pub 3", author: "Author 3"),
            .init(uuid: 4, title: "Book 4", coverUrl: nil, publishDate: "2021", publisher: "Pub 4", author: "Author 4"),
            .init(uuid: 5, title: "Book 5", coverUrl: nil, publishDate: "2021", publisher: "Pub 5", author: "Author 5"),
            .init(uuid: 6, title: "Book 6", coverUrl: nil, publishDate: "2021", publisher: "Pub 6", author: "Author 6"),
            .init(uuid: 7, title: "Book 7", coverUrl: nil, publishDate: "2021", publisher: "Pub 7", author: "Author 7"),
            .init(uuid: 8, title: "Book 8asfd asdfad afsad", coverUrl: nil, publishDate: "2021", publisher: "Pub 8", author: "Author 8"),
        ]
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            completion(.success(books))
        }
    }
    
    func setFavorite(bookUuid: Int, isFavorite: Bool, completion: @escaping (Result<(), Error>) -> Void) {
        completion(.failure(BookServiceError.invalidOperation))
    }
}
