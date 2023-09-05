//
//  BookListViewModel.swift
//  hyweb-ios-exam
//
//  Created by Roy on 2023/9/5.
//

import Foundation
import RxSwift
import RxCocoa

class BookListViewModel {
    
    // MARK: - Observables
    var books: Observable<[Book]?> { _books.asObservable() }
    
    // MARK: - Stores
    private var _books = BehaviorRelay<[Book]?>(value: nil)
    
    // MARK: - Setup
    init(dependencies: Dependencies) {
        self.dependencies = dependencies
    }
    
    // MARK: - Actions
    func fetchBooks() {
        dependencies.bookService.fetchBooks { [weak self]  result in
            switch result {
            case .success(let books):
                self?._books.accept(books)
            case .failure(let error):
                print(error) // TODO: later
            }
        }
    }
    
    // MARK: - Dependencies
    public var dependencies: Dependencies
    
    public struct Dependencies {
        let bookService: BookServiceProtocol
    }
}
