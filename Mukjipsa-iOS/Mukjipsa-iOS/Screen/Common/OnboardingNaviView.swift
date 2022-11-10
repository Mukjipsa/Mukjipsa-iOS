//
//  OnboardingNaviView.swift
//  Mukjipsa-iOS
//
//  Created by 강윤서 on 2022/11/08.
//

import UIKit

import SnapKit
import Then

class OnboardingNaviView: BaseView {
    // MARK: - View Style
    enum ViewType {
        case basic
        case notBasic
        case finish
    }
    
    // MARK: - Properties
    var viewType: ViewType = .basic {
        didSet {
            setUI()
        }
    }
    
    // MARK: - UIComponents
    private let naviView = UIView()
    private let backButton = UIButton()
    private let laterButton = UIButton()
    
    override func setUI() {
        setLaterButton()
        backButton.do {
            $0.setImage(Constant.Image.backButton, for: .normal)
        }
        
        laterButton.do {
            $0.titleLabel?.text = Constant.String.Onboarding.doItLater
            $0.titleLabel?.font = .b2
            $0.setLineHeightAndletterSpacing(letterSpacing: Constant.LetterSpacing.b2)
            $0.titleLabel?.textColor = .gray3
        }
    }
    
    override func setLayout() {
        naviView.addSubviews([backButton, laterButton])
        addSubview(naviView)
        
        naviView.snp.makeConstraints {
            $0.directionalHorizontalEdges.equalToSuperview()
            $0.top.equalToSuperview()
            $0.height.equalTo(44)
        }
        
        backButton.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalToSuperview().inset(16)
        }
        
        laterButton.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.trailing.equalToSuperview().inset(16)
        }
    }
}

extension OnboardingNaviView {
    private func setLaterButton() {
        switch viewType {
        case .basic:
            backButton.isHidden = true
        case .notBasic:
            backButton.isHidden = false
        case .finish:
            laterButton.isHidden = true
            backButton.isHidden = false
        }
    }
}
