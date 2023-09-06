//
//  BookServiceProtocol.swift
//  hyweb-ios-exam
//
//  Created by Roy on 2023/9/5.
//

import Foundation

protocol BookServiceProtocol {
    func fetchBooks(completion: @escaping (Result<[Book], Error>) -> Void)
    func setFavorite(bookUuid: Int, isFavorite: Bool, completion: @escaping (Result<(), Error>) -> Void)
}

enum BookServiceError: Error {
    case bookNotFound
    case invalidOperation
    case underlying(error: Error)
}
