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
        coverView.translatesAutoresizingMaskIntoConstraints = false
        coverView.backgroundColor = .green
        vstack.addArrangedSubview(coverView)
        coverView.snp.makeConstraints {
            $0.width.equalTo(coverView.snp.height).multipliedBy(110.0 / 154.0)
        }
        
        let coverImageView = UIImageView()
        coverImageView.translatesAutoresizingMaskIntoConstraints = false
        coverImageView.layer.cornerRadius = 4
        coverImageView.contentMode = .scaleAspectFill
        coverView.addSubview(coverImageView)
        coverImageView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        self.coverImageView = coverImageView
        
        let favoriteButton = UIButton()
        favoriteButton.translatesAutoresizingMaskIntoConstraints = false
        coverView.addSubview(favoriteButton)
        favoriteButton.snp.makeConstraints {
            $0.width.height.equalTo(44)
            $0.top.trailing.equalToSuperview()
        }
        self.favoriteButton = favoriteButton
        
        let titleLabel = UILabel()
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.textColor = UIColor(white: 0, alpha: 0.85)
        titleLabel.numberOfLines = 2
        titleLabel.setContentHuggingPriority(.defaultHigh, for: .vertical)
        vstack.addArrangedSubview(titleLabel)
        self.titleLabel = titleLabel
    }
    
    // MARK: - Configure
    func configure(with book: Book) {
        coverImageView?.kf.setImage(with: book.coverUrl)
        
        titleLabel?.text = book.title
        
        favoriteButton?.isSelected = book.isFavorite == true
    }
    
}
