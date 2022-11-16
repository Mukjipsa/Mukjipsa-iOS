//
//  GuideView.swift
//  Mukjipsa-iOS
//
//  Created by 강윤서 on 2022/11/10.
//

import UIKit

import SnapKit
import Then

class GuideView: BaseView {
    // MARK: - UI Components
    private let naviView = OnboardingNaviView()
    private let guideLabel = UILabel()
    private let subGuideLabel = UILabel()
    private let gotoLabel = UILabel()
    private let guideImage = UIImageView()
    private let nextButton = MJSButton()
    
    override func setUI() {
        naviView.do {
            $0.viewType = .basic
        }
        
        guideLabel.do {
            $0.text = Constant.String.Onboarding.guideMessage
            $0.textColor = .dark
            $0.numberOfLines = 2
            $0.setLineHeightAndletterSpacing(Constant.fontSize.sh1, Constant.LetterSpacing.sh1)
            $0.font = .sh1
            $0.textAlignment = .center
        }
        
        subGuideLabel.do {
            $0.text = Constant.String.Onboarding.subGuideMessage
            $0.textColor = .gray2
            $0.numberOfLines = 2
            $0.setLineHeightAndletterSpacing(Constant.fontSize.sh2, Constant.LetterSpacing.sh2)
            $0.font = .sh2
            $0.textAlignment = .center
        }
        
        gotoLabel.do {
            $0.text = Constant.String.Onboarding.gotoMessage
            $0.textColor = .gray2
            $0.numberOfLines = 2
            $0.setLineHeightAndletterSpacing(Constant.fontSize.sh2, Constant.LetterSpacing.sh2)
            $0.font = .sh2
            $0.textAlignment = .center
        }
        
        nextButton.do {
            $0.setTitle(Constant.String.Onboarding.gotoButton, for: .normal)
        }
    }
    
    override func setLayout() {
        addSubviews([naviView, guideLabel, subGuideLabel,
                     gotoLabel, guideImage, nextButton])
        
        naviView.snp.makeConstraints {
            $0.top.directionalHorizontalEdges.equalToSuperview()
            $0.height.equalTo(44)
        }
        
        guideLabel.snp.makeConstraints {
            $0.top.equalTo(naviView.snp.bottom).offset(56)
            $0.centerX.equalToSuperview()
        }
        
        subGuideLabel.snp.makeConstraints {
            $0.top.equalTo(guideLabel.snp.bottom).offset(32)
            $0.centerX.equalToSuperview()
        }
        
        gotoLabel.snp.makeConstraints {
            $0.top.equalTo(subGuideLabel.snp.bottom).offset(12)
            $0.center.equalToSuperview()
        }
        
        nextButton.snp.makeConstraints {
            $0.bottom.equalToSuperview().inset(8)
            $0.directionalHorizontalEdges.equalToSuperview().inset(16)
            $0.height.equalTo(56)
        }
    }
}
