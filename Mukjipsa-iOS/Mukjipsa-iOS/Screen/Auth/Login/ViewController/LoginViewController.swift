//
//  LoginViewController.swift
//  Mukjipsa-iOS
//
//  Created by 강윤서 on 2022/11/09.
//

import UIKit

import SnapKit
import Then

final class LoginViewController: BaseViewController {
    
    // MARK: - UI Components
    private let loginView = LoginView()

    override func viewDidLoad() {
        super.viewDidLoad()
        setLayout()
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
