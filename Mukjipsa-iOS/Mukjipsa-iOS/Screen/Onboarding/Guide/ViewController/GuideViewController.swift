//
//  GuideViewController.swift
//  Mukjipsa-iOS
//
//  Created by 강윤서 on 2022/11/10.
//

import UIKit

class GuideViewController: BaseViewController {
    // MARK: - UI Components
    private let guideView = GuideView()

    override func viewDidLoad() {
        super.viewDidLoad()
        setLayout()
    }
}

extension GuideViewController {
    private func setLayout() {
        view.addSubview(guideView)
        
        guideView.snp.makeConstraints {
            $0.edges.equalTo(view.safeAreaLayoutGuide)
        }
    }
}
