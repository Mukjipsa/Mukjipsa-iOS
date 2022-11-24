//
//  SearchHeaderView.swift
//  Mukjipsa-iOS
//
//  Created by 황찬미 on 2022/11/24.
//

import UIKit

import SnapKit
import Then

final class SearchHeaderView: UIView {
    
    let searchHeaderView = UIView()
    let backButton = UIButton().then {
        $0.setImage(Constant.Image.icBack, for: .normal)
    }
    
    let placeholder = UILabel().then {
        $0.text = "어떤 메뉴를 찾으시나요?"
        $0.setLineHeightAndletterSpacing(Constant.fontSize.sh2, Constant.LetterSpacing.sh2)
        $0.textColor = .gray3
    }
    let searchTextField = UITextField().then {
        $0.setLineHeightAndletterSpacing(Constant.fontSize.sh2, Constant.LetterSpacing.sh2)
        $0.backgroundColor = .gray4
        $0.borderStyle = .roundedRect
        $0.clearButtonMode = .always
        $0.addLeftPadding()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setLayout()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setLayout() {
        addSubview(searchHeaderView)
        searchHeaderView.addSubviews([backButton, searchTextField])
        searchTextField.addSubview(placeholder)
        
        searchHeaderView.snp.makeConstraints {
            $0.top.leading.trailing.equalToSuperview()
            $0.height.equalTo(44)
        }
        
        backButton.snp.makeConstraints {
            $0.leading.equalToSuperview().inset(16)
            $0.centerY.equalToSuperview()
        }
        
        searchTextField.snp.makeConstraints {
            $0.leading.equalToSuperview().inset(56)
            $0.trailing.equalToSuperview().inset(16)
            $0.height.equalTo(36)
            $0.centerY.equalToSuperview()
        }
        
        placeholder.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalToSuperview().inset(20)
        }
    }
}
