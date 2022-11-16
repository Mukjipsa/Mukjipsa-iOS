//
//  OnboardingSeparatorFooter.swift
//  Mukjipsa-iOS
//
//  Created by 강윤서 on 2022/11/16.
//

import UIKit

import SnapKit
import Then

class OnboardingCollectionViewSectionFooter: UICollectionReusableView {
    // MARK: - UI Components
    private let separatorView = UIView()
    
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

extension OnboardingCollectionViewSectionFooter {
    private func setUI() {
        separatorView.do {
            $0.backgroundColor = .gray3
        }
    }
    
    private func setLayout() {
        addSubview(separatorView)
        
        separatorView.snp.makeConstraints {
            $0.directionalHorizontalEdges.equalToSuperview()
            $0.height.equalTo(1)
            $0.edges.equalToSuperview()
        }
    }
}
