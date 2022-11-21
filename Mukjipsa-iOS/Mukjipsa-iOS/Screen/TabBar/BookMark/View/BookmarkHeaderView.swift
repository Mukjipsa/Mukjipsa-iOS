//
//  BookmarkHeaderView.swift
//  Mukjipsa-iOS
//
//  Created by 황찬미 on 2022/11/18.
//

import UIKit

import SnapKit
import Then

final class BookmarkHeaderView: UICollectionReusableView {
    
    static let identifier = "BookmarkHeaderView"
    
    private let recipeNumberLabel = UILabel().then {
        $0.text = "레시피 3개"
        $0.font = .b4
        $0.textColor = .dark
        $0.setLineHeightAndletterSpacing(Constant.fontSize.b4, Constant.LetterSpacing.b4)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setLayout()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setLayout() {
        addSubview(recipeNumberLabel)
        
        recipeNumberLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(16)
            $0.leading.equalToSuperview()
            $0.bottom.equalToSuperview().inset(16)
        }
    }
}
