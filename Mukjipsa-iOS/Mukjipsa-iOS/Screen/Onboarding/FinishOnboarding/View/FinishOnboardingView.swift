//
//  FinishOnboardingView.swift
//  Mukjipsa-iOS
//
//  Created by 강윤서 on 2022/11/10.
//

import UIKit

import SnapKit
import Then

class FinishOnboardingView: BaseView {
    // MARK: - UI Components
    private let naviView = OnboardingNaviView()
    private let finishLabel = UILabel()
    private let subFinishLabel = UILabel()
    private let finishImageView = UIImageView()
    private let finishButton = MJSButton()
    
    override func setUI() {
        naviView.do {
            $0.viewType = .finish
        }
        
        finishLabel.do {
            $0.text = Constant.String.Onboarding.finishMessage
            $0.font = .sh1
            $0.setLineHeightAndletterSpacing(letterSpacing: Constant.LetterSpacing.sh1)
            $0.textColor = .dark
        }
        
        subFinishLabel.do {
            $0.text = Constant.String.Onboarding.subFinishMessage
            $0.font = .sh2
            $0.setLineHeightAndletterSpacing(letterSpacing: Constant.LetterSpacing.sh2)
            $0.textColor = .gray2
            $0.numberOfLines = 0
            $0.textAlignment = .center
        }
        
        finishButton.do {
            $0.setTitle(Constant.String.Onboarding.gotoMyRecipe, for: .normal)
        }
    }
    
    override func setLayout() {
        addSubviews([naviView, finishLabel, subFinishLabel, finishImageView, finishButton])
        
        naviView.snp.makeConstraints {
            $0.top.directionalHorizontalEdges.equalToSuperview()
            $0.height.equalTo(44)
        }
        
        finishLabel.snp.makeConstraints {
            $0.top.equalTo(naviView.snp.bottom).offset(56)
            $0.centerX.equalToSuperview()
        }
        
        subFinishLabel.snp.makeConstraints {
            $0.top.equalTo(finishLabel.snp.bottom).offset(32)
            $0.centerX.equalToSuperview()
        }
        
        finishButton.snp.makeConstraints {
            $0.bottom.equalToSuperview().inset(8)
            $0.directionalHorizontalEdges.equalToSuperview().inset(16)
            $0.height.equalTo(56)
        }
    }
}
