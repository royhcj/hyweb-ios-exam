//
//  LocalBookService.swift
//  hyweb-ios-exam
//
//  Created by Roy on 2023/9/6.
//

import Foundation

class LocalBookService: BookServiceProtocol {
    static let sahred = LocalBookService()
    
    private init() {
    }
    
    func fetchBooks(completion: @escaping (Result<[Book], Error>) -> Void) {
        BookPersistenceStore.shared.fetchBooks { result in
            switch result {
            case .success(let bookEntities):
                let books = bookEntities.map {
                    Book(entity: $0)
                }
                completion(.success(books))
            case .failure(let error):
                if let error = error as? BookPersistenceStoreError {
                    switch error {
                    case .bookNotFound:
                        completion(.failure(BookServiceError.bookNotFound))
                    }
                } else {
                    completion(.failure(BookServiceError.underlying(error: error)))
                }
            }
        }
    }
    
    func setFavorite(bookUuid: Int, isFavorite: Bool, completion: @escaping (Result<(), Error>) -> Void) {
        BookPersistenceStore.shared.fetchBooks { result in
            switch result {
            case .success:
                completion(.success(()))
            case .failure(let error):
                if let error = error as? BookPersistenceStoreError {
                    switch error {
                    case .bookNotFound:
                        completion(.failure(BookServiceError.bookNotFound))
                    }
                } else {
                    completion(.failure(BookServiceError.underlying(error: error)))
                }
            }
        }
    }
}
