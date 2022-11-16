//
//  SplashViewController.swift
//  Mukjipsa-iOS
//
//  Created by 강윤서 on 2022/11/10.
//

import UIKit

class SplashViewController: UIViewController {
    // MARK: - UI Components
    private let splashView = SplashView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setLayout()
    }

}

extension SplashViewController {
    private func setLayout() {
        view.addSubview(splashView)
        
        splashView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
}
