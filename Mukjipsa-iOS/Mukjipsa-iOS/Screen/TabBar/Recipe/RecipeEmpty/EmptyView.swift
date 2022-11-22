//
//  EmptyView.swift
//  Mukjipsa-iOS
//
//  Created by 황찬미 on 2022/11/22.
//

import UIKit

import SnapKit
import Then

final class EmptyView: UIView {
    
    // 1. 레시피 empty
    // 2. 검색 empty - 1, - 2
    // 3. 북마크 empty
    
    enum emptyView {
        case recipeEmpty
        case searchEmpty
        case bookmarkEmpty
    }
    
    let recipeNumberLabel = UILabel().then {
        $0.text = "레시피 0개"
        $0.font = .b4
        $0.textColor = .dark
        $0.setLineHeightAndletterSpacing(Constant.fontSize.b4, Constant.LetterSpacing.b4)
    }
    
    let possibleButton = UIImageView().then {
        $0.image = Constant.Image.btnPossibleSelected
    }
    
    let impossibleButton = UIImageView().then {
        $0.image = Constant.Image.btnPossible
    }
    
    let emptyImage = UIView()
    let headerLabel = UILabel()
    let subLabel = UILabel()
    let ingredientSelectedbutton = MJSButton().then {
        $0.setTitle("재료 입력하기", for: .normal)
    }
    
    // MARK: - Initialize
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUI(mode: emptyView) {
        switch mode {
        case .recipeEmpty:
            emptyImage.do {
                $0.backgroundColor = .dark
            }
            headerLabel.do {
                $0.text = "입력하지 않은 재료가 있나요?"
                $0.font = .h3
                $0.textColor = .dark
                $0.setLineHeightAndletterSpacing(Constant.fontSize.h3, Constant.LetterSpacing.h3)
                $0.textAlignment = .center
            }
            subLabel.do {
                $0.text = """
                          레시피를 추천할 수 있도록
                          가지고 있는 재료를 모두 입력해 주세요
                          """
                $0.font = .b2
                $0.textColor = .gray2
                $0.setLineHeightAndletterSpacing(Constant.fontSize.b2, Constant.LetterSpacing.b2)
                $0.textAlignment = .center
            }
        case .bookmarkEmpty:
            possibleButton.isHidden = true
            emptyImage.do {
                $0.backgroundColor = .primary
            }
            headerLabel.do {
                $0.text = "레시피를 북마크 해보세요!"
                $0.font = .sh2
                $0.textColor = .dark
                $0.setLineHeightAndletterSpacing(Constant.fontSize.sh2, Constant.LetterSpacing.sh2)
                $0.textAlignment = .center
            }
            subLabel.do {
                $0.text = """
                          마음에 드는 레시피를 북마크하면
                          쉽게 다시 볼 수 있어요
                          """
                $0.font = .b2
                $0.textColor = .gray2
                $0.setLineHeightAndletterSpacing(Constant.fontSize.b2, Constant.LetterSpacing.b2)
                $0.textAlignment = .center
            }
            ingredientSelectedbutton.isHidden = true
        case .searchEmpty:
            emptyImage.do {
                $0.backgroundColor = .blue
            }
            subLabel.do {
                $0.text = """
                          수제버거에 해당하는 레시피가 없어요
                          다른 메뉴를 검색해 보세요
                          """
                $0.font = .b2
                $0.textColor = .gray2
                $0.setLineHeightAndletterSpacing(Constant.fontSize.b2, Constant.LetterSpacing.b2)
                $0.textAlignment = .center
            }
            ingredientSelectedbutton.isHidden = true
        }
    }
    
    func setLayout(mode: emptyView) {
        addSubviews([recipeNumberLabel, possibleButton, emptyImage, headerLabel, subLabel, ingredientSelectedbutton])
        
        switch mode {
        case .recipeEmpty:
            recipeNumberLabel.snp.makeConstraints {
                $0.top.leading.equalToSuperview().inset(16)
            }
            
            possibleButton.snp.makeConstraints {
                $0.top.trailing.equalToSuperview().inset(16)
            }
            
            emptyImage.snp.makeConstraints {
                $0.top.equalTo(recipeNumberLabel.snp.bottom).offset(96)
                $0.width.equalTo(358)
                $0.height.equalTo(200)
            }
            
            headerLabel.snp.makeConstraints {
                $0.top.equalTo(emptyImage.snp.bottom).offset(44)
                $0.centerX.equalToSuperview()
            }
            
            subLabel.snp.makeConstraints {
                $0.top.equalTo(headerLabel.snp.bottom).offset(10)
                $0.centerX.equalToSuperview()
            }
            
            ingredientSelectedbutton.snp.makeConstraints {
                $0.top.equalTo(subLabel.snp.bottom).offset(40)
                $0.leading.trailing.equalToSuperview().inset(110)
            }
        case .bookmarkEmpty:
            recipeNumberLabel.snp.makeConstraints {
                $0.top.leading.equalToSuperview().inset(16)
            }
            
            emptyImage.snp.makeConstraints {
                $0.top.equalTo(recipeNumberLabel.snp.bottom).offset(132)
                $0.width.equalTo(358)
                $0.height.equalTo(200)
            }
            
            headerLabel.snp.makeConstraints {
                $0.top.equalTo(emptyImage.snp.bottom).offset(48)
                $0.centerX.equalToSuperview()
            }
            
            subLabel.snp.makeConstraints {
                $0.top.equalTo(headerLabel.snp.bottom).offset(16)
                $0.centerX.equalToSuperview()
            }
        case .searchEmpty:
            recipeNumberLabel.snp.makeConstraints {
                $0.top.leading.equalToSuperview().inset(16)
            }
            
            possibleButton.snp.makeConstraints {
                $0.top.trailing.equalToSuperview().inset(16)
            }
            
            emptyImage.snp.makeConstraints {
                $0.top.equalTo(recipeNumberLabel.snp.bottom).offset(132)
                $0.width.equalTo(358)
                $0.height.equalTo(200)
            }
            
            subLabel.snp.makeConstraints {
                $0.top.equalTo(emptyImage.snp.bottom).offset(68)
                $0.centerX.equalToSuperview()
            }
        }
    }
}
