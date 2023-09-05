//
//  BookListCell.swift
//  hyweb-ios-exam
//
//  Created by Roy on 2023/9/5.
//

import UIKit
import RxSwift
import SnapKit
import Kingfisher

class BookListCell: UICollectionViewCell {
    
    var bag = DisposeBag()
    var titleLabel: UILabel?
    var favoriteButton: UIButton?
    var coverImageView: UIImageView?
    
    // MARK: - Object lifecycle
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupLayout()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLayout()
    }
    
    // MARK: - Layout
    private func setupLayout() {
        backgroundColor = .clear
        
        let vstack = UIStackView()
        vstack.axis = .vertical
        vstack.distribution = .equalSpacing
        contentView.addSubview(vstack)
        vstack.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        let coverView = UIView()
        coverView.backgroundColor = .clear
        vstack.addArrangedSubview(coverView)
        
        let coverImageView = UIImageView()
        coverImageView.layer.cornerRadius = 4
        coverImageView.contentMode = .scaleAspectFill
        coverView.addSubview(coverImageView)
        self.coverImageView = coverImageView
        
        let favoriteButton = UIButton()
        coverView.addSubview(favoriteButton)
        favoriteButton.snp.makeConstraints {
            $0.width.height.equalTo(44)
            $0.top.trailing.equalToSuperview()
        }
        self.favoriteButton = favoriteButton
        
        let titleLabel = UILabel()
        titleLabel.textColor = UIColor(white: 0, alpha: 0.85)
        titleLabel.numberOfLines = 2
        vstack.addArrangedSubview(titleLabel)
        self.titleLabel = titleLabel
    }
    
    // MARK: - Configure
    func configure(with book: Book) {
        coverImageView?.kf.setImage(with: book.coverUrl)
    }
    
}
