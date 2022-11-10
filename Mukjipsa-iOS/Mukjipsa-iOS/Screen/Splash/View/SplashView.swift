//
//  SplashView.swift
//  Mukjipsa-iOS
//
//  Created by 강윤서 on 2022/11/10.
//

import UIKit

import SnapKit
import Then

class SplashView: BaseView {
    // MARK: - UI Components
    private let logoImageView = UIImageView()
    
    override func setUI() {
        backgroundColor = .secondary
        logoImageView.do {
            $0.image = Constant.Image.Splash.MJSlogo
        }
    }
    
    override func setLayout() {
        addSubview(logoImageView)
        logoImageView.snp.makeConstraints {
            $0.center.equalToSuperview()
        }
    }
}
