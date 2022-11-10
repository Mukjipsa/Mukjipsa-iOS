//
//  RecipeViewController.swift
//  Mukjipsa-iOS
//
//  Created by 황찬미 on 2022/11/01.
//

import UIKit
import Then
import SnapKit

final class RecipeViewController: UIViewController {
    
    // MARK: - Property
    
    // MARK: - UI Property
    private let testLabel = UILabel().then{
        $0.text = "안녕하세요 테스트 중"
    }
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        setLayout()
        view.backgroundColor = .white
    }
    
    // MARK: - @objc
    
    // MARK: - Custom Method
    private func setUI() {
        testLabel.do {
            $0.font = .t1
            $0.setLineHeightAndletterSpacing(letterSpacing: Constant.LetterSpacing.t1)
        }
    }
}

extension RecipeViewController {
    private func setLayout() {
        view.addSubview(testLabel)
        testLabel.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
    }
}
