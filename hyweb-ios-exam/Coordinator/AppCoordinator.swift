//
//  AppCoordinator.swift
//  hyweb-ios-exam
//
//  Created by Roy on 2023/9/5.
//

import UIKit

class AppCoordinator {
    let dependencies: Dependencies
    
    // MARK: - Object lifecycle
    init(dependencies: Dependencies) {
        self.dependencies = dependencies
    }
    
    // MARK: - Start
    func start(with sourceViewController: UIViewController) {
        showBookList(over: sourceViewController)
    }
    
    func showBookList(over sourceViewController: UIViewController) {
        let viewModelDependencies = BookListViewModel.Dependencies(bookService: dependencies.bookService)
        let viewModel = BookListViewModel(dependencies: viewModelDependencies)
        let viewController = BookListViewController(viewModel: viewModel)
        
        sourceViewController.present(viewController, animated: false)
        
    }
    
    
    // MARK: - Dependencies
    struct Dependencies {
        var bookService: BookServiceProtocol
    }
}

