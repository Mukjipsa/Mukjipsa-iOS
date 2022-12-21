//
//  LoginViewController.swift
//  Mukjipsa-iOS
//
//  Created by 강윤서 on 2022/11/09.
//

import UIKit

import RxSwift
import KakaoSDKUser
import RxKakaoSDKUser
import SnapKit
import Then

final class LoginViewController: BaseViewController {
    
    // MARK: - UI Components
    private let loginView = LoginView()
    private lazy var loginButton = loginView.kakaoLoginButton
    
    private lazy var disposeBag = DisposeBag()

    override func viewDidLoad() {
        super.viewDidLoad()
        setLayout()
    }
    
    override func bind() {
//        loginButton.rx.tap
//            .bind(onNext: {
//                UserApi.shared.rx.loginWithKakaoAccount()
//                    .subscribe(onNext: { oauthToken in
//                        print("loginWithKakaoAccount() success.")
//                        print(oauthToken.accessToken)
//                        _ = oauthToken
//                    }, onError: {error in
//                        print(error)
//                    })
//                    .disposed(by: self.disposeBag)
//            })
    }
}

extension LoginViewController {
    private func setLayout() {
        view.addSubview(loginView)
        
        loginView.snp.makeConstraints {
            $0.edges.equalTo(view.safeAreaLayoutGuide)
        }
    }
}
