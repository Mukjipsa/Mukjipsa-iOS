//
//  RecipeHeaderView.swift
//  Mukjipsa-iOS
//
//  Created by 황찬미 on 2022/11/12.
//

import UIKit

import SnapKit
import Then

final class RecipeHeaderView: UITableViewHeaderFooterView {
    
    enum RecipeHeader {
        case myRecipe
        case totalRecipe
    }

    var recipeHedaer: RecipeHeader
    
    private let recipeHeaderLabel = UILabel()
    private let recipeNumberLabel = UILabel()
    private let possibleIc = UIView()
    private let possibleLabel = UILabel()
    
    init(reuseIdentifier: String?, mode: RecipeHeader) {
        self.recipeHedaer = mode
        super.init(reuseIdentifier: reuseIdentifier)

        setUI(mode: recipeHedaer)
        setLayout()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUI(mode: RecipeHeader) {
        recipeHeaderLabel.do {
            switch mode {
            case .myRecipe:
                $0.text = """
                          짠미님,
                          바로 해먹을 수 있어요!
                          """
                $0.font = .sh1
                $0.textColor = .dark
                $0.numberOfLines = 0
                $0.setLineHeightAndletterSpacing(letterSpacing: Constant.LetterSpacing.sh1)
            case .totalRecipe:
                $0.text = """
                          윤돌님,
                          오늘은 이런 메뉴 어때요?
                          """
                $0.font = .sh1
                $0.textColor = .dark
                $0.numberOfLines = 0
                $0.setLineHeightAndletterSpacing(letterSpacing: Constant.LetterSpacing.sh1)
            }
        }

        recipeNumberLabel.do {
            $0.text = "레시피 15개"
            $0.font = .b4
            $0.textColor = .dark
            $0.setLineHeightAndletterSpacing(letterSpacing: Constant.LetterSpacing.b4)
        }

        possibleIc.do {
            $0.backgroundColor = .dark
        }

        possibleLabel.do {
            $0.text = "바로 가능"
            $0.font = .b4
            $0.textColor = .dark
            $0.setLineHeightAndletterSpacing(letterSpacing: Constant.LetterSpacing.b4)
        }
    }
    
    private func setLayout() {
        addSubviews([recipeHeaderLabel, recipeNumberLabel, possibleIc, possibleLabel])
        
        recipeHeaderLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(16)
            $0.leading.trailing.equalToSuperview()
        }
        
        recipeNumberLabel.snp.makeConstraints {
            $0.top.equalTo(recipeHeaderLabel.snp.bottom).offset(24)
            $0.leading.equalToSuperview()
            $0.bottom.equalToSuperview().inset(12)
        }
        
        possibleIc.snp.makeConstraints {
            $0.top.equalTo(recipeHeaderLabel.snp.bottom).offset(24)
            $0.trailing.equalTo(possibleLabel.snp.leading).offset(-6)
            $0.height.width.equalTo(18)
        }
        
        possibleLabel.snp.makeConstraints {
            $0.top.equalTo(recipeHeaderLabel.snp.bottom).offset(24)
            $0.trailing.equalToSuperview()
        }
    }
}
