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
    //MARK: Properties
    var progress: Int = 0
    
    //MARK: UIComponents
    private let naviView = UIView()
    private let backButton = UIButton()
    private let laterButton = UIButton()
    private let progressView = UIView()
    private let progressBarImageView = UIImageView()
    private let progressLabel = UILabel()
    
    override func setUI() {
        backButton.do{
            $0.setImage(Constant.Image.backButton, for: .normal)
        }
        
        laterButton.do{
            $0.titleLabel?.text = Constant.String.Onboarding.doItLater
            $0.titleLabel?.font = .b2
            $0.setLineHeightAndletterSpacing(letterSpacing: Constant.LetterSpacing.b2)
            $0.titleLabel?.textColor = .gray3
        }
        
        progressLabel.do{
            $0.textColor = .gray2
            $0.font = .b1
            $0.setLineHeightAndletterSpacing(letterSpacing: Constant.LetterSpacing.b1)
            $0.text = "\(progress)/5"
        }
    }
    
    override func setLayout() {
        naviView.addSubviews([backButton, laterButton])
        progressView.addSubviews([progressBarImageView, progressLabel])
        addSubviews([naviView, progressView])
        
        naviView.snp.makeConstraints{
            $0.directionalVerticalEdges.equalToSuperview()
            $0.top.equalToSuperview()
            $0.height.equalTo(44)
        }
        
        progressView.snp.makeConstraints{
            $0.directionalVerticalEdges.equalToSuperview()
            $0.top.equalTo(naviView.snp.bottom)
            $0.height.equalTo(36)
        }
        
        backButton.snp.makeConstraints{
            $0.centerY.equalToSuperview()
            $0.leading.equalToSuperview().inset(16)
        }
        
        laterButton.snp.makeConstraints{
            $0.centerY.equalToSuperview()
            $0.trailing.equalToSuperview().inset(16)
        }
        
        progressBarImageView.snp.makeConstraints{
            $0.centerY.equalToSuperview()
            $0.leading.equalToSuperview().inset(16)
        }
        
        progressLabel.snp.makeConstraints{
            $0.centerY.equalToSuperview()
            $0.trailing.equalToSuperview().inset(16)
        }
        
    }
}
