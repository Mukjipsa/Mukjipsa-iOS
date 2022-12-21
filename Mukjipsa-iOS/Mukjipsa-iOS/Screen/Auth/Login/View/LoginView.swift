//
//  LoginView.swift
//  Mukjipsa-iOS
//
//  Created by 강윤서 on 2022/11/09.
//

import UIKit

import SnapKit
import Then

class LoginView: BaseView {
    // MARK: - UI Components
    private let logoImageView = UIImageView()
    let kakaoLoginButton = UIButton()
    
    override func setUI() {
        logoImageView.image = Constant.Image.Auth.logoImage
        kakaoLoginButton.setBackgroundImage(Constant.Image.Auth.kakaoLogin, for: .normal)
    }
    
    override func setLayout() {
        addSubviews([logoImageView, kakaoLoginButton])
        
        logoImageView.snp.makeConstraints {
            $0.top.equalToSuperview().offset(271)
            $0.directionalHorizontalEdges.equalToSuperview().inset(16)
        }
        
        kakaoLoginButton.snp.makeConstraints {
            $0.directionalHorizontalEdges.equalToSuperview().inset(16)
            $0.bottom.equalToSuperview().inset(8)
        }
    }
}
