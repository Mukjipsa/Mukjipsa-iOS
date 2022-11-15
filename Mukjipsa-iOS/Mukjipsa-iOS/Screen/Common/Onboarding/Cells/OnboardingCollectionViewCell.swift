//
//  OnboardingCollectionViewCell.swift
//  Mukjipsa-iOS
//
//  Created by 강윤서 on 2022/11/13.
//

import UIKit

import SnapKit
import Then

class OnboardingCollectionViewCell: UICollectionViewCell, UICollectionViewRegisterable {
    // MARK: - View Type
    enum ViewType {
        case selected
        case unselected
    }
    
    // MARK: - Properties
    static var isFromNib: Bool = false
    
    // MARK: - UIComponents
    private let checkImageView = UIImageView()
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

extension OnboardingCollectionViewCell {
    private func setUI() {
        contentView.do {
            $0.layer.cornerRadius = $0.layer.frame.height / 2
            $0.layer.borderWidth = 1.0
            $0.layer.borderColor = UIColor.gray3.cgColor
            $0.layer.masksToBounds = true
        }
        
        checkImageView.do {
            $0.image = Constant.Image.Onboarding.checkIcon
        }
        
        ingredientLabel.do {
            $0.textColor = .gray3
            $0.font = .sh2
            $0.setLineHeightAndletterSpacing(letterSpacing: Constant.LetterSpacing.sh2)
        }
    }
    
    private func setLayout() {
        contentView.addSubviews([checkImageView, ingredientLabel])
        
//        checkImageView.snp.makeConstraints {
//            $0.directionalVerticalEdges.equalToSuperview().inset(10)
//            $0.leading.equalToSuperview().inset(20)
//        }
        
        ingredientLabel.snp.makeConstraints {
            $0.directionalVerticalEdges.equalToSuperview().inset(6)
            $0.directionalHorizontalEdges.equalToSuperview().inset(20)
        }
    }
    
    func configure(_ model: ingredientModel) {
        ingredientLabel.text = model.ingredientName
    }
}
