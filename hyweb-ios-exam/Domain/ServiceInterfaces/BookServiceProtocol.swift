//
//  BookServiceProtocol.swift
//  hyweb-ios-exam
//
//  Created by Roy on 2023/9/5.
//

import Foundation

protocol BookServiceProtocol {
    func fetchBooks(completion: @escaping (Result<[Book], Error>) -> Void)
}
