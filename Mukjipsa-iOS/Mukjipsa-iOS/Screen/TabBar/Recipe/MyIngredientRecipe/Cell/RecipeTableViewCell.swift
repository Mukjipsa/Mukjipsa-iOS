//
//  RecipeTableViewCell.swift
//  Mukjipsa-iOS
//
//  Created by 황찬미 on 2022/11/11.
//

import UIKit

import SnapKit
import Then

final class RecipeTableViewCell: UITableViewCell, UITableViewRegisterable {
    
    // MARK: - Property

    static var isFromNib: Bool = false
    
    // MARK: - UI Property
    
    private let recipeImage = UIView().then {
        $0.backgroundColor = .green
    }
    private let recipeContainerView = UIView()
    private let recipeName = UILabel().then {
        $0.text = "수제버거"
        $0.font = .h1
        $0.textColor = .dark
        $0.setLineHeightAndletterSpacing(letterSpacing: Constant.LetterSpacing.h1)
    }
    
    private let recipeIc = UIView().then {
        $0.backgroundColor = .primary
    }
    private let channelName = UILabel().then {
        $0.text = "채널 이름"
        $0.font = .b3
        $0.textColor = .gray2
        $0.setLineHeightAndletterSpacing(letterSpacing: Constant.LetterSpacing.b3)
    }
    
    private let channelSite = UILabel().then {
        $0.text = "• YouTube"
        $0.font = .b4
        $0.textColor = .gray3
        $0.setLineHeightAndletterSpacing(letterSpacing: Constant.LetterSpacing.b4)
    }
    
    // MARK: - Life Cycle
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setLayout()
        setCellEffect()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 0.0, left: 0.0, bottom: 16.0, right: 0.0))
    }
    
    // MARK: - Custom Method
    
    private func setCellEffect() {
        contentView.layer.cornerRadius = 20
        contentView.layer.borderWidth = 0.01
        contentView.layer.applySketchShadow(color: .black, alpha: 0.1, x: 0.0, y: 0.0, blur: 10.0, spread: 0.0)
    }
    
    private func setLayout() {
        contentView.addSubview(recipeContainerView)
        recipeContainerView.addSubviews([recipeImage, recipeName, recipeIc, channelName, channelSite])
        
        recipeContainerView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        recipeImage.snp.makeConstraints {
            $0.leading.top.trailing.equalToSuperview()
            $0.height.equalTo(201)
        }
        
        recipeName.snp.makeConstraints {
            $0.top.equalTo(recipeImage.snp.bottom).offset(16)
            $0.leading.equalTo(recipeContainerView.snp.leading).inset(16)
        }
        
        recipeIc.snp.makeConstraints {
            $0.top.equalTo(recipeName.snp.bottom).offset(3)
            $0.leading.equalTo(recipeContainerView.snp.leading).inset(16)
            $0.width.height.equalTo(18)
        }
        
        channelName.snp.makeConstraints {
            $0.top.equalTo(recipeName.snp.bottom).offset(2)
            $0.leading.equalTo(recipeIc.snp.trailing).offset(4)
        }
        
        channelSite.snp.makeConstraints {
            $0.top.equalTo(recipeName.snp.bottom).offset(2)
            $0.leading.equalTo(channelName.snp.trailing).offset(4)
        }
    }
}
