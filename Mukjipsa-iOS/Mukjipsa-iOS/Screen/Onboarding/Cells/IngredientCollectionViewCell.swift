//
//  IngredientCollectionViewCell.swift
//  Mukjipsa-iOS
//
//  Created by 강윤서 on 2022/11/09.
//

import UIKit

import SnapKit
import Then

class IngredientCollectionViewCell: UICollectionViewCell, UICollectionViewRegisterable {
    //MARK: Properties
    static var isFromNib: Bool = false
    
    //MARK: UIComponents
    private let ingredientImageView = UIView()
    private let categoryLabel = UILabel()
    private let ingredientLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUI()
        setLayout()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension IngredientCollectionViewCell {
    private func setUI() {
        contentView.do{
            $0.layer.cornerRadius = 16
            $0.layer.borderWidth = 1.0
            $0.layer.borderColor = UIColor.dark.cgColor
        }
        
        ingredientImageView.do{
            $0.backgroundColor = .dark
        }
        
        categoryLabel.do{
            $0.text = "육류"
            $0.textColor = .dark
            $0.font = .b2
            $0.setLineHeightAndletterSpacing(letterSpacing: Constant.LetterSpacing.b2)
        }
        
        ingredientLabel.do{
            $0.text = "소고기"
            $0.textColor = .dark
            $0.font = .h1
            $0.setLineHeightAndletterSpacing(letterSpacing: Constant.LetterSpacing.h1)
        }
    }
    
    private func setLayout() {
        contentView.addSubviews([ingredientImageView, categoryLabel, ingredientLabel])

        ingredientImageView.snp.makeConstraints{
            $0.top.equalToSuperview().offset(15.5)
            $0.leading.equalToSuperview().inset(24)
            $0.size.equalTo(18)
        }

        categoryLabel.snp.makeConstraints{
            $0.top.equalToSuperview().inset(14)
            $0.leading.equalTo(ingredientImageView.snp.trailing).offset(6)
        }

        ingredientLabel.snp.makeConstraints{
            $0.leading.equalToSuperview().inset(24)
            $0.bottom.equalToSuperview().inset(10)
        }
    }
    
    func configure(_ model: BasicIngredientModel) {
        categoryLabel.text = model.category
        ingredientLabel.text = model.ingredientName
    }
}
