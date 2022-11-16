//
//  MSJCancelButton.swift
//  Mukjipsa-iOS
//
//  Created by 강윤서 on 2022/11/10.
//

import UIKit

class MJSCancelButton: UIButton {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setButtonStyle()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension MJSCancelButton {
    private func setButtonStyle() {
        backgroundColor = .white
        layer.cornerRadius = 16
        layer.borderColor = UIColor.gray4.cgColor
        layer.borderWidth = 2.0
        setTitleColor(.gray3, for: .normal)
        titleLabel?.font = .bu1
        titleLabel?.textAlignment = .center
        setLineHeightAndletterSpacing(Constant.fontSize.bu1, Constant.LetterSpacing.bu1)
    }
}
