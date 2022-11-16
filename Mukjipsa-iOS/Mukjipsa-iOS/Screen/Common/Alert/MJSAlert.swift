//
//  MJSAlert.swift
//  Mukjipsa-iOS
//
//  Created by 강윤서 on 2022/11/10.
//

import UIKit

import SnapKit
import Then

class MJSAlert: BaseView {
    // MARK: - View Style
    enum ViewType {
        case later
        case finishBasic
    }
    
    // MARK: - Properties
    var viewType: ViewType = .later {
        didSet {
            setButton()
            setAlerViewLayout()
        }
    }
    
    // MARK: - UI Components
    private let alertView = UIView()
    private let titleLabel = UILabel()
    private let explainLabel = UILabel()
    private let alertImageView = UIImageView()
    private let cancelButton = MJSCancelButton()
    private let okButton = MJSButton()
    
    override func setUI() {
        self.backgroundColor = .dark.withAlphaComponent(0.7)
        
        alertView.do {
            $0.backgroundColor = .white
            $0.layer.cornerRadius = 16
        }
        
        titleLabel.do {
            $0.textAlignment = .center
            $0.textColor = .dark
            $0.font = .h2
            $0.setLineHeightAndletterSpacing(Constant.fontSize.h2, Constant.LetterSpacing.h2)
        }
        
        explainLabel.do {
            $0.textAlignment = .center
            $0.textColor = .gray2
            $0.font = .b2
            $0.setLineHeightAndletterSpacing(Constant.fontSize.b2, Constant.LetterSpacing.b2)
        }
        
        cancelButton.do {
            $0.setTitle(Constant.String.Alert.laterButton, for: .normal)
        }
    }
    
    override func setLayout() {
        addSubview(alertView)
        alertView.addSubviews([titleLabel, explainLabel, alertImageView, cancelButton, okButton])
        
        alertView.snp.makeConstraints {
            $0.center.equalToSuperview()
            $0.width.equalTo(300)
            $0.height.greaterThanOrEqualTo(383)
        }
        
        titleLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(32)
            $0.centerX.equalToSuperview()
        }
        
        explainLabel.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(8)
            $0.centerX.equalToSuperview()
        }
        
        alertImageView.snp.makeConstraints {
            $0.top.equalTo(explainLabel).offset(24)
            $0.directionalHorizontalEdges.equalToSuperview().inset(20)
            $0.height.equalTo(150)
        }
        
        cancelButton.snp.makeConstraints {
            $0.leading.equalToSuperview().inset(21)
            $0.bottom.equalToSuperview().inset(20)
            $0.width.equalTo(125)
            $0.height.equalTo(56)
        }
        
        okButton.snp.makeConstraints {
            $0.trailing.equalToSuperview().inset(21)
            $0.bottom.equalToSuperview().inset(20)
            $0.width.equalTo(125)
            $0.height.equalTo(56)
        }
    }
}

extension MJSAlert {
    private func setButton() {
        switch viewType {
        case .later:
            titleLabel.text = Constant.String.Alert.laterTitle
            explainLabel.text = Constant.String.Alert.laterExplain
            alertImageView.isHidden = true
            okButton.setTitle(Constant.String.Alert.doitNowButton, for: .normal)
        case .finishBasic:
            titleLabel.text = Constant.String.Alert.finishBasicTitle
            explainLabel.text = Constant.String.Alert.finishBasicExplain
            alertImageView.isHidden = false
            okButton.setTitle(Constant.String.Alert.continueButton, for: .normal)
        }
    }
    
    private func setAlerViewLayout() {
        switch viewType {
        case .later:
            alertView.snp.updateConstraints {
                $0.height.greaterThanOrEqualTo(188)
            }
        case .finishBasic:
            alertView.snp.updateConstraints {
                $0.height.greaterThanOrEqualTo(383)
            }
        }
    }
}
