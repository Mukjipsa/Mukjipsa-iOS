//
//  OnboardingCollectionViewHeader.swift
//  Mukjipsa-iOS
//
//  Created by 강윤서 on 2022/11/15.
//

import UIKit

import SnapKit
import Then

class OnboardingCollectionViewSectionHeader: BaseView {
    // MARK: ViewType
    public enum ViewType {
        case meat
        case sea
        case vegetable
        case grain
        case saurce
        case egg
        case bread
        case etc
        
        // TODO: 이미지 받으면 코드 수정
//        var image: UIImage {
//            switch self {
//            case .meat:
//                return UIImage()
//            case .sea:
//                return UIImage()
//            case .vegetable:
//                return UIImage()
//            case .grain:
//                return UIImage()
//            case .saurce:
//                return UIImage()
//            case .egg:
//                return UIImage()
//            case .bread:
//                return UIImage()
//            case .etc:
//                return UIImage()
//            }
//        }
    }
    
    // MARK: UI Components
    // TODO: 이미지 받으면 UIImageView로 코드 수정
    private let categoryImageView = UIView()
    private let categoryLabel = UILabel()
    var viewType = ViewType.meat {
        didSet {
            setUI()
        }
    }
    
    override func setUI() {
        categoryImageView.do {
            $0.backgroundColor = .dark
        }
        
        categoryLabel.do {
            $0.font = .h1
            $0.textColor = .dark
            $0.setLineHeightAndletterSpacing(letterSpacing: Constant.LetterSpacing.h1)
        }
    }
    
    override func setLayout() {
        addSubviews([categoryImageView, categoryLabel])
        
        categoryImageView.snp.makeConstraints {
            $0.height.width.equalTo(24)
            $0.leading.equalToSuperview()
            $0.centerY.equalToSuperview().inset(3)
        }
        
        categoryLabel.snp.makeConstraints {
            $0.leading.equalTo(categoryImageView.snp.trailing).offset(3)
            $0.centerY.equalToSuperview()
        }
    }
}


extension OnboardingCollectionViewSectionHeader {
    func configure(_ viewType: ViewType) {
        switch viewType {
        case .meat:
            categoryLabel.text = "육류"
        case .sea:
            categoryLabel.text = "해산물"
        case .vegetable:
            categoryLabel.text = "채소"
        case .grain:
            categoryLabel.text = "곡류"
        case .saurce:
            categoryLabel.text = "소스/조미료"
        case .egg:
            categoryLabel.text = "알류/우유/유제품"
        case .bread:
            categoryLabel.text = "빵/떡/면"
        case .etc:
            categoryLabel.text = "그 외"
        }
    }
}
