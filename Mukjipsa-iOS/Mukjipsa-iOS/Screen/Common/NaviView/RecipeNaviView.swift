//
//  RecipeNaviView.swift
//  Mukjipsa-iOS
//
//  Created by 황찬미 on 2022/11/10.
//

import UIKit

import SnapKit
import Then

final class RecipeNaviView: UIView {
    
    enum NaviMode {
        case mainRecipe
        case search
        case detailRecipe
        case bookmark
        case myIngredient
    }
    
    var naviMode: NaviMode
    
    let naviView = UIView()
    let logo = UIImageView()
    let searchButton = UIButton()
    let backButton = UIButton()
    let titleLabel = UILabel()
    
    init(frame: CGRect, mode: NaviMode) {
        self.naviMode = mode
        super.init(frame: frame)
        
        setupMode(mode: naviMode)
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupMode(mode: NaviMode) {
        switch mode {
        case .mainRecipe:
            setUI(mode: .mainRecipe)
            setLayout(mode: .mainRecipe)
        case .search:
            setUI(mode: .search)
            setLayout(mode: .search)
        case .detailRecipe:
            setUI(mode: .detailRecipe)
            setLayout(mode: .detailRecipe)
        case .bookmark:
            setUI(mode: .bookmark)
            setLayout(mode: .bookmark)
        case .myIngredient:
            setUI(mode: .myIngredient)
            setLayout(mode: .myIngredient)
        }
    }
    
    private func setUI(mode: NaviMode) {
        switch mode {
        case .mainRecipe:
            logo.do {
                $0.image = Constant.Image.logo
            }
            searchButton.do {
                $0.setImage(Constant.Image.icSearch, for: .normal)
            }
        case .search:
            searchButton.do {
                $0.setImage(Constant.Image.icSearch, for: .normal)
            }
        case .detailRecipe:
            backButton.do {
                $0.setImage(Constant.Image.icBack, for: .normal)
            }
            titleLabel.do {
                $0.text = "돈코츠 라멘"
                $0.font = .h1
                $0.textColor = .dark
                $0.setLineHeightAndletterSpacing(Constant.fontSize.h1, Constant.LetterSpacing.h1)
            }
        case .bookmark:
            titleLabel.do {
                $0.text = Constant.String.Recipe.bookmark
                $0.font = .h1
                $0.textColor = .dark
                $0.setLineHeightAndletterSpacing(Constant.fontSize.h1, Constant.LetterSpacing.h1)
            }
            searchButton.do {
                $0.backgroundColor = .primary
            }
        case .myIngredient:
            titleLabel.do {
                $0.text = Constant.String.Recipe.myIngredient
                $0.font = .h1
                $0.textColor = .dark
                $0.setLineHeightAndletterSpacing(Constant.fontSize.h1, Constant.LetterSpacing.h1)
            }
        }
    }
    
    private func setLayout(mode: NaviMode) {
        switch mode {
        case .mainRecipe:
            naviView.addSubviews([logo, searchButton])
            addSubview(naviView)
            
            naviView.snp.makeConstraints {
                $0.leading.top.trailing.equalTo(safeAreaLayoutGuide)
                $0.height.equalTo(44)
            }
            
            logo.snp.makeConstraints {
                $0.leading.equalToSuperview().inset(16)
                $0.centerY.equalToSuperview()
            }
            
            searchButton.snp.makeConstraints {
                $0.trailing.equalToSuperview().inset(16)
                $0.centerY.equalToSuperview()
            }
        case .search:
            naviView.addSubview(searchButton)
            addSubview(naviView)
            
            naviView.snp.makeConstraints {
                $0.leading.top.trailing.equalTo(safeAreaLayoutGuide)
                $0.height.equalTo(44)
            }
            
            searchButton.snp.makeConstraints {
                $0.leading.equalToSuperview().inset(16)
                $0.centerY.equalToSuperview()
            }
        case .detailRecipe:
            naviView.addSubviews([backButton, titleLabel])
            addSubview(naviView)
            
            naviView.snp.makeConstraints {
                $0.leading.top.trailing.equalTo(safeAreaLayoutGuide)
                $0.height.equalTo(44)
            }
            
            backButton.snp.makeConstraints {
                $0.leading.equalToSuperview().inset(16)
                $0.centerY.equalToSuperview()
            }
            
            titleLabel.snp.makeConstraints {
                $0.leading.equalTo(backButton.snp.trailing).offset(12)
                $0.centerY.equalToSuperview()
            }
        case .bookmark:
            naviView.addSubviews([titleLabel, searchButton])
            addSubview(naviView)
            
            naviView.snp.makeConstraints {
                $0.leading.top.trailing.equalTo(safeAreaLayoutGuide)
                $0.height.equalTo(44)
            }
            
            titleLabel.snp.makeConstraints {
                $0.leading.equalToSuperview().inset(16)
                $0.centerY.equalToSuperview()
            }
            
            searchButton.snp.makeConstraints {
                $0.trailing.equalToSuperview().inset(16)
                $0.centerY.equalToSuperview()
            }
        case .myIngredient:
            naviView.addSubview(titleLabel)
            addSubview(naviView)
            
            naviView.snp.makeConstraints {
                $0.leading.top.trailing.equalTo(safeAreaLayoutGuide)
                $0.height.equalTo(44)
            }
            
            titleLabel.snp.makeConstraints {
                $0.leading.equalToSuperview().inset(16)
                $0.centerY.equalToSuperview()
            }
        }
    }
}
