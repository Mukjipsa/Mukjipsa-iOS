//
//  RecipeCollectionViewCell.swift
//  Mukjipsa-iOS
//
//  Created by 황찬미 on 2022/11/14.
//

import UIKit

import SnapKit
import Then

final class RecipeTagCell: UICollectionViewCell, UICollectionViewRegisterable {
    
    // MARK: - Property
    
    static var isFromNib: Bool = false
    
    // MARK: - UI Property
    
    private let ingredientIc = UIView().then {
        $0.backgroundColor = .dark
    }
    private let ingredientLabel = UILabel().then {
        $0.text = "치즈"
        $0.font = .b2
        $0.textColor = .gray1
        $0.setLineHeightAndletterSpacing(Constant.fontSize.b2, Constant.LetterSpacing.b2)
    }
    
    // MARK: - Life Cycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setLayout()
        setCellEffect()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
//    override func layoutSubviews() {
//        super.layoutSubviews()
//        ingredientIc.preferredMaxLayoutWidth = ingredientIc.frame.size.width
//        ingredientLabel.preferredMaxLayoutWidth = ingredientLabel.frame.size.width
//        super.layoutSubviews()
//    }
    
    // MARK: - Custom Method
    
    private func setCellEffect() {
        backgroundColor = .gray4
        
        self.layer.masksToBounds = true
        self.layer.cornerRadius = 20
    }
    
    private func setLayout() {
        addSubviews([ingredientIc, ingredientLabel])
        
        ingredientIc.snp.makeConstraints {
            $0.leading.equalToSuperview().inset(12)
            $0.centerY.equalToSuperview()
            $0.height.width.equalTo(16)
        }
        
        ingredientLabel.snp.makeConstraints {
            $0.centerY.equalTo(ingredientIc)
            $0.leading.equalTo(ingredientIc.snp.trailing).offset(4)
            $0.trailing.equalToSuperview().inset(12)
        }
    }
}
