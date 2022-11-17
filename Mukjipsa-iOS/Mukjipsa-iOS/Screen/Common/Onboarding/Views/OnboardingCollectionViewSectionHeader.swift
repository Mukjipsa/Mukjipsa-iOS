//
//  OnboardingCollectionViewHeader.swift
//  Mukjipsa-iOS
//
//  Created by 강윤서 on 2022/11/15.
//

import UIKit

import SnapKit
import Then

class OnboardingCollectionViewSectionHeader: UICollectionReusableView {
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
        
        var category: String {
            switch self {
            case .meat:
                return "육류"
            case .sea:
                return "해산물"
            case .vegetable:
                return "채소"
            case .grain:
                return "곡류"
            case .saurce:
                return "소스/조미료"
            case .egg:
                return "알류/우유/유제품"
            case .bread:
                return "빵/떡/면"
            case .etc:
                return "그 외"
                
            }
        }
    }
    
    // MARK: - Properties
    static let identifier = "OnboardingCollectionViewSectionHeader"
    
    // MARK: UI Components
    // TODO: 이미지 받으면 UIImageView로 코드 수정
    private let categoryImageView = UIView()
    var categoryLabel = UILabel()
    var viewType = ViewType.meat {
        didSet {
            setUI()
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUI()
        setLayout()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        categoryLabel.text = viewType.category
      }
}

extension OnboardingCollectionViewSectionHeader {
    private func setText(_ viewType: ViewType) {
        categoryLabel.text = viewType.category
    }
    
    private func setUI() {
        categoryImageView.do {
            $0.backgroundColor = .dark
        }
        
        categoryLabel.do {
            $0.font = .h1
            $0.textColor = .dark
            $0.setLineHeightAndletterSpacing(Constant.fontSize.h1, Constant.LetterSpacing.h1)
            $0.text = viewType.category
        }
    }
    
    private func setLayout() {
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
