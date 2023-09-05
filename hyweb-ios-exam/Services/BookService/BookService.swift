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

    }
}
