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
    
    enum EmptyMode {
        case recipeEmpty
        case searchEmpty
        case bookmarkEmpty
    }
    
    var emptyMode: EmptyMode
    
    // MARK: - UIComponents
    
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
    let ingredientSelectedbutton = UIButton().then {
        $0.setTitle("재료 입력하기", for: .normal)
        $0.backgroundColor = .primary
        $0.setTitleColor(.white, for: .normal)
        $0.titleLabel?.font = .bu1
        $0.layer.cornerRadius = 8
        $0.titleLabel?.textAlignment = .center
        $0.setLineHeightAndletterSpacing(Constant.fontSize.bu1, Constant.LetterSpacing.bu1)
    }
    
    // MARK: - Initialize
    
    init(frame: CGRect, mode: EmptyMode) {
        self.emptyMode = mode
        super.init(frame: frame)
        
        setUI(mode: mode)
        setLayout(mode: mode)
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Custom Method
    
    private func setUI(mode: EmptyMode) {
        switch mode {
        case .recipeEmpty:
            emptyImage.do {
                $0.backgroundColor = .dark
            }
            headerLabel.do {
                $0.text = "입력하지 않은 재료가 있나요?"
                $0.textColor = .dark
                $0.setLineHeightAndletterSpacing(Constant.fontSize.h3, Constant.LetterSpacing.h3)
                $0.textAlignment = .center
            }
            subLabel.do {
                $0.text = """
                          레시피를 추천할 수 있도록
                          가지고 있는 재료를 모두 입력해 주세요
                          """
                $0.textColor = .gray2
                $0.setLineHeightAndletterSpacing(Constant.fontSize.b2, Constant.LetterSpacing.b2)
                $0.numberOfLines = 2
                $0.textAlignment = .center
            }
        case .bookmarkEmpty:
            emptyImage.do {
                $0.backgroundColor = .dark
            }
            headerLabel.do {
                $0.text = "레시피를 북마크 해보세요!"
                $0.textColor = .dark
                $0.setLineHeightAndletterSpacing(Constant.fontSize.h3, Constant.LetterSpacing.h3)
                $0.textAlignment = .center
            }
            subLabel.do {
                $0.text = """
                          마음에 드는 레시피를 북마크하면
                          쉽게 다시 볼 수 있어요
                          """
                $0.textColor = .gray2
                $0.setLineHeightAndletterSpacing(Constant.fontSize.b2, Constant.LetterSpacing.b2)
                $0.numberOfLines = 2
                $0.textAlignment = .center
            }
        case .searchEmpty:
            emptyImage.do {
                $0.backgroundColor = .blue
            }
            subLabel.do {
                $0.text = """
                          수제버거에 해당하는 레시피가 없어요
                          다른 메뉴를 검색해 보세요
                          """
                $0.textColor = .gray2
                $0.setLineHeightAndletterSpacing(Constant.fontSize.b2, Constant.LetterSpacing.b2)
                $0.numberOfLines = 2
                $0.textAlignment = .center
            }
        }
    }
    
    private func setLayout(mode: EmptyMode) {
        switch mode {
        case .recipeEmpty:
            addSubviews([recipeNumberLabel, possibleButton, emptyImage, headerLabel, subLabel, ingredientSelectedbutton])
            
            recipeNumberLabel.snp.makeConstraints {
                $0.top.leading.equalToSuperview().inset(16)
            }
            
            possibleButton.snp.makeConstraints {
                $0.top.trailing.equalToSuperview().inset(16)
            }
            
            emptyImage.snp.makeConstraints {
                $0.top.equalTo(recipeNumberLabel.snp.bottom).offset(96)
                $0.centerX.equalToSuperview()
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
                $0.height.equalTo(44)
            }
        case .bookmarkEmpty:
            addSubviews([recipeNumberLabel, emptyImage, headerLabel, subLabel])
            
            recipeNumberLabel.snp.makeConstraints {
                $0.top.leading.equalToSuperview().inset(16)
            }
            
            emptyImage.snp.makeConstraints {
                $0.top.equalTo(recipeNumberLabel.snp.bottom).offset(132)
                $0.centerX.equalToSuperview()
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
            addSubviews([recipeNumberLabel, possibleButton, emptyImage, subLabel])
                recipeNumberLabel.snp.makeConstraints {
                    $0.top.leading.equalToSuperview().inset(16)
                }
                
                possibleButton.snp.makeConstraints {
                    $0.top.trailing.equalToSuperview().inset(16)
                }
                
                emptyImage.snp.makeConstraints {
                    $0.top.equalTo(recipeNumberLabel.snp.bottom).offset(132)
                    $0.centerX.equalToSuperview()
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
