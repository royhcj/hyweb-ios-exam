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
    
    private func showBookList(over sourceViewController: UIViewController) {
        let viewModelDependencies = BookListViewModel.Dependencies(bookService: dependencies.bookService)
        let viewModel = BookListViewModel(dependencies: viewModelDependencies)
        let viewController = BookListViewController(viewModel: viewModel)
        
        let navigationController = UINavigationController(rootViewController: viewController)
        navigationController.modalPresentationStyle = .overFullScreen
        
        viewController.route = { route in
            switch route {
            case .close:
                viewController.dismiss(animated: true)
            case .showBook(let uuid):
                self.showBookDetail(bookUuid: uuid, over: navigationController)
            }
        }
        
        sourceViewController.present(navigationController, animated: false)
    }
    
    private func showBookDetail(bookUuid: Int, over sourceViewController: UINavigationController) {
        // Show book detail
    }
    
    
    // MARK: - Dependencies
    struct Dependencies {
        var bookService: BookServiceProtocol
    }
}

