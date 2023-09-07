//
//  BookService.swift
//  hyweb-ios-exam
//
//  Created by Roy on 2023/9/5.
//

import Foundation

class BookService: BookServiceProtocol {
    static let shared = BookService()
    
    private init() {
    }
    
    func fetchBooks(completion: @escaping (Result<[Book], Error>) -> Void) {
        LocalBookService.shared.fetchBooks { result in
            switch result {
            case .success(let localBooks):
                RemoteBookService.shared.fetchBooks { result in
                    switch result {
                    case .success(var remoteBooks):
                        self.fillIsFavorite(from: localBooks, to: &remoteBooks)
                        LocalBookService.shared.merge(with: remoteBooks) { _ in }
                        completion(.success(remoteBooks))
                    case .failure:
                        completion(.success(localBooks))
                    }
                }
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    func setFavorite(bookUuid: Int, isFavorite: Bool, completion: @escaping (Result<(), Error>) -> Void) {
        LocalBookService.shared.setFavorite(bookUuid: bookUuid, isFavorite: isFavorite) { result in
            switch result {
            case .success:
                completion(.success(()))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    private func fillIsFavorite(from localBooks: [Book], to targetBooks: inout [Book]) {
        for index in 0..<targetBooks.count {
            guard let localBook = localBooks.first(where: { $0.uuid == targetBooks[index].uuid }) else {
                continue
            }
            targetBooks[index].isFavorite = localBook.isFavorite
        }
    }
}
