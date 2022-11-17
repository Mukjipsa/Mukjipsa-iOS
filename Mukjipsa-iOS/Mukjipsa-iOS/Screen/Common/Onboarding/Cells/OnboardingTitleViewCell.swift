//
//  OnboardingTitleView.swift
//  Mukjipsa-iOS
//
//  Created by 강윤서 on 2022/11/08.
//

import UIKit

import SnapKit
import Then

class OnboardingTitleViewCell: UICollectionViewCell, UICollectionViewRegisterable {
    
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
    
    // MARK: - Properties
    static var isFromNib: Bool = false
    var viewType: ViewType = .saurce {
        didSet {
            setText()
        }
    }
    
    // MARK: - UIComponents
    private let titleView = UIView()
    private let titleLabel = UILabel()
    private let explainLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUI()
        setLayout()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension OnboardingTitleViewCell {
    private func setUI() {
        titleView.do {
            $0.backgroundColor = .gray4
            $0.layer.cornerRadius = 6
        }
        
        titleLabel.do {
            $0.textColor = .primary
            $0.font = .h2
            $0.setLineHeightAndletterSpacing(Constant.fontSize.h2, Constant.LetterSpacing.h2)
            $0.text = viewType.setText
        }
        
        explainLabel.do {
            $0.textColor = .gray1
            $0.font = .sh2
            $0.text = Constant.String.Onboarding.selectHaveIngredient
            $0.setLineHeightAndletterSpacing(Constant.fontSize.sh2, Constant.LetterSpacing.sh2)
        }
    }
    
    private func setLayout() {
        titleView.addSubview(titleLabel)
        addSubviews([titleView, explainLabel])
        
        titleView.snp.makeConstraints {
            $0.height.equalTo(35)
            $0.top.leading.equalToSuperview()
            $0.width.greaterThanOrEqualTo(titleLabel.snp.width).offset(20)
        }
        
        titleLabel.snp.makeConstraints {
            $0.center.equalToSuperview()
            $0.centerX.equalToSuperview()
        }
        
        explainLabel.snp.makeConstraints {
            $0.top.equalTo(titleView.snp.bottom).offset(6)
            $0.directionalHorizontalEdges.equalToSuperview()
        }
    }
    
    private func setText() {
        titleLabel.text = viewType.setText
    }
}
