//
//  BookListViewController.swift
//  hyweb-ios-exam
//
//  Created by Roy on 2023/9/5.
//

import UIKit
import RxSwift
import RxCocoa
import RxOptional
import SnapKit

class BookListViewController: UIViewController {
    
    var viewModel: BookListViewModelProtocol
    
    private var bag = DisposeBag()
    
    private var collectionView: UICollectionView?
    
    // MARK: - Object/View lifecycle
    init(viewModel: BookListViewModelProtocol) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
        
        createLayout()
        bindViewModel()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Layout
    private func createLayout() {
        title = "我的書櫃"
        
        let collectionView = UICollectionView()
        collectionView.contentInsetAdjustmentBehavior = .never
        view.addSubview(collectionView)
        collectionView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        collectionView.register(BookListCell.self, forCellWithReuseIdentifier: "BookListCell")
        self.collectionView = collectionView
    }
    
    // MARK: - Binding
    private func bindViewModel() {
        guard let collectionView = collectionView else { return }
        
        viewModel.books
            .filterNil()
            .bind(to: collectionView.rx.items(cellIdentifier: "BookListCell", cellType: BookListCell.self)) { index, book, cell in
                cell.configure(with: book)
            }.disposed(by: bag)
    }
}

