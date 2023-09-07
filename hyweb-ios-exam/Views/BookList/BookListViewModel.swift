//
//  BookListViewModel.swift
//  hyweb-ios-exam
//
//  Created by Roy on 2023/9/5.
//

import Foundation
import RxSwift
import RxCocoa

class BookListViewModel: BookListViewModelProtocol {
    
    // MARK: - Observables
    var onBooksChanged: Observable<[Book]?> { books.asObservable() }
    var onErrorMessage = PublishSubject<String>()
    
    // MARK: - Stores
    private var books = BehaviorRelay<[Book]?>(value: nil)
    
    // MARK: - Setup
    init(dependencies: Dependencies) {
        self.dependencies = dependencies
    }
    
    // MARK: - Actions
    func fetchBooks() {
        dependencies.bookService.fetchBooks { [weak self] result in
            switch result {
            case .success(let books):
                self?.books.accept(books)
            case .failure(let error):
                print(error) // TODO: later
            }
        }
    }
    
    func setBookFavorite(bookUuid: Int, isFavorite: Bool) {
        dependencies.bookService.setFavorite(bookUuid: bookUuid, isFavorite: isFavorite) { [weak self] result in
            switch result {
            case .success:
                var books = self?.books.value ?? []
                guard let index = books.firstIndex(where: { $0.uuid == bookUuid }) else {
                    return
                }
                books[index].isFavorite = isFavorite
                self?.books.accept(books)
                
            case .failure(let error):
                self?.onErrorMessage.onNext(error.localizedDescription)
            }
        }
    }
    
    // MARK: - Dependencies
    public var dependencies: Dependencies
    
    public struct Dependencies {
        let bookService: BookServiceProtocol
    }
}
