//
//  FinishOnboardingViewController.swift
//  Mukjipsa-iOS
//
//  Created by 강윤서 on 2022/11/10.
//

import UIKit

class FinishOnboardingViewController: BaseViewController {
    // MARK: - UI Components
    private let finishOnboardingView = FinishOnboardingView()

    override func viewDidLoad() {
        super.viewDidLoad()
        setLayout()
    }
}

extension FinishOnboardingViewController {
    private func setLayout() {
        view.addSubview(finishOnboardingView)
        
        finishOnboardingView.snp.makeConstraints {
            $0.edges.equalTo(view.safeAreaLayoutGuide)
        }
    }
}
