//
//  ProgressBarImageView.swift
//  Mukjipsa-iOS
//
//  Created by 강윤서 on 2022/11/10.
//

import UIKit

import SnapKit

class ProgressBarImageView: BaseView {
    // MARK: - View Type
    enum ViewType {
        case One
        case Two
        case Three
        case Four
        
        var image: UIImage? {
            switch self {
            case .One:
                return Constant.Image.Onboarding.progressBarImageOne
            case .Two:
                return Constant.Image.Onboarding.progressBarImageTwo
            case .Three:
                return Constant.Image.Onboarding.progressBarImageThree
            case .Four:
                return Constant.Image.Onboarding.progressBarImageFour
            }
        }
        
    }
    
    // MARK: - Properties
    var viewType: ViewType = .One {
        didSet {
            setUI()
        }
    }
    
    // MARK: - UI Components
    private let progressBarImageView = UIImageView()
    
    override func setUI() {
        progressBarImageView.image = viewType.image
    }
    
    override func setLayout() {
        addSubview(progressBarImageView)
        
        progressBarImageView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
}
