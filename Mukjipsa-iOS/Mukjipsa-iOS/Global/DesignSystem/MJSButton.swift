//
//  MJSButton.swift
//  Mukjipsa-iOS
//
//  Created by 황찬미 on 2022/11/08.
//

import UIKit

final class MJSButton: UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setButtonStyle()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setButtonStyle() {
        self.backgroundColor = .primary
        self.setTitleColor(.white, for: .normal)
        self.titleLabel?.font = .bu1
        self.layer.cornerRadius = 16
        self.titleLabel?.textAlignment = .center
        setLineHeightAndletterSpacing(letterSpacing: Constant.LetterSpacing.bu1)
    }
}
