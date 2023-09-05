//
//  RemoteBookService.swift
//  hyweb-ios-exam
//
//  Created by Roy on 2023/9/5.
//

import Foundation
import IORequestable

class RemoteBookService: BookServiceProtocol {
    static let shared = RemoteBookService()
    
    private init() {
    }
    
    func fetchBooks(completion: @escaping (Result<[Book], Error>) -> Void) {
        BookAPI.FetchBooks(.init())
            .execute { result in
                switch result {
                case .success(let apiBooks):
                    let books = apiBooks.map { Book(with: $0) }
                    completion(.success(books))
                case .failure(let error):
                    completion(.failure(error))
                }
            }
    }
}
