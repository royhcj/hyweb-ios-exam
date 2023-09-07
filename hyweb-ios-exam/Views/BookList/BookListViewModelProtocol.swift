//
//  BookListViewModelProtocol.swift
//  hyweb-ios-exam
//
//  Created by Roy on 2023/9/5.
//

import Foundation
import RxSwift

protocol BookListViewModelProtocol {
    
    // MARK: - Observables
    var onBooksChanged: Observable<[Book]?> { get }
    var onErrorMessage: PublishSubject<String> { get }
    
    // MARK: - Actions
    func fetchBooks()
    func setBookFavorite(bookUuid: Int, isFavorite: Bool)
}
