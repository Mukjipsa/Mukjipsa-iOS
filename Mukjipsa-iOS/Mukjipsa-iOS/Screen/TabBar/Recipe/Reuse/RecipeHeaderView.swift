//
//  RecipeHeaderView.swift
//  Mukjipsa-iOS
//
//  Created by 황찬미 on 2022/11/12.
//

import UIKit

import SnapKit
import Then

final class RecipeHeaderView: UICollectionReusableView {
    
    static let identifier = "RecipeHeaderView"
    
    enum RecipeHeader {
        case myRecipe
        case totalRecipe
    }

    var recipeHeader: RecipeHeader = .myRecipe {
        didSet {
            setUI()
        }
    }
    
    private let recipeHeaderLabel = UILabel()
    private let recipeNumberLabel = UILabel()
    private let possibleIc = UIImageView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setLayout()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUI() {
        recipeHeaderLabel.do {
            if recipeHeader == .myRecipe {
                $0.text = """
                          짠미님,
                          바로 해먹을 수 있어요!
                          """
                $0.font = .sh1
                $0.textColor = .dark
                $0.numberOfLines = 0
                $0.setLineHeightAndletterSpacing(Constant.fontSize.sh1, Constant.LetterSpacing.sh1)
            } else {
                $0.text = """
                          윤돌님,
                          오늘은 이런 메뉴 어때요?
                          """
                $0.font = .sh1
                $0.textColor = .dark
                $0.numberOfLines = 0
                $0.setLineHeightAndletterSpacing(Constant.fontSize.sh1, Constant.LetterSpacing.sh1)
            }
        }

        recipeNumberLabel.do {
            $0.text = "레시피 15개"
            $0.font = .b4
            $0.textColor = .dark
            $0.setLineHeightAndletterSpacing(Constant.fontSize.b4, Constant.LetterSpacing.b4)
        }

        possibleIc.do {
            $0.image = Constant.Image.btnPossibleSelected
        }
    }
    
    private func setLayout() {
        addSubviews([recipeHeaderLabel, recipeNumberLabel, possibleIc])
        
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
            $0.trailing.equalToSuperview()
        }
    }
}
