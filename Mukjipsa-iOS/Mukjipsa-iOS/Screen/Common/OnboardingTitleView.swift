//
//  OnboardingTitleView.swift
//  Mukjipsa-iOS
//
//  Created by 강윤서 on 2022/11/08.
//

import UIKit

import SnapKit
import Then

class OnboardingTitleView: BaseView {
    // MARK: - View Style
    enum ViewType {
        case meat
        case vegatable
        case saurce
        case etc
        
        var setText: String {
            switch self {
            case .meat:
                return Constant.String.Onboarding.meatAndSeafood
            case .vegatable:
                return Constant.String.Onboarding.vegetableAndGrain
            case .saurce:
                return Constant.String.Onboarding.saurce
            case .etc:
                return Constant.String.Onboarding.etc
            }
        }
    }
    
    //MARK: Properties
    var viewType: ViewType = .meat {
        didSet {
            setText()
        }
    }
    
    //MARK: UIComponents
    private let titleView = UIView()
    private let titleLabel = UILabel()
    
    override func setUI() {
        titleView.do {
            $0.backgroundColor = .gray4
            $0.layer.cornerRadius = 6
        }
        
        titleLabel.do {
            $0.textColor = .primary
            $0.font = .h2
            $0.setLineHeightAndletterSpacing(letterSpacing: Constant.LetterSpacing.h2)
            $0.text = viewType.setText
        }
    }
    
    override func setLayout() {
        titleView.addSubview(titleLabel)
        addSubview(titleView)
        
        titleView.snp.makeConstraints{
            $0.edges.equalToSuperview()
            $0.height.equalTo(35)
            $0.width.greaterThanOrEqualTo(titleLabel.snp.width).offset(20)
        }
        
        titleLabel.snp.makeConstraints{
            $0.center.equalToSuperview()
        }
    }
}

extension OnboardingTitleView {
    private func setText() {
        titleLabel.text = viewType.setText
    }
}
