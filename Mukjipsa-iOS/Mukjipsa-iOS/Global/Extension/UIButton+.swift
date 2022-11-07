//
//  UIButton+.swift
//  Mukjipsa-iOS
//
//  Created by 강윤서 on 2022/11/07.
//

import UIKit

extension UIButton {
    /// 자간과 lineHeight를 모두 조정하는 메서드
    func setletterSpacingAndlineHeight(lineHieghtMultiple: CGFloat = 1.5,
                                       letterSpacing: CGFloat = -0.02) {
        if let text = self.titleLabel?.text {
            let style = NSMutableParagraphStyle()
            style.lineHeightMultiple = lineHieghtMultiple
            let attributes: [NSAttributedString.Key: Any] = [
                .paragraphStyle: style,
                .kern: lineHieghtMultiple
            ]
            let attributedStr = NSMutableAttributedString(string: text,
                                                          attributes: attributes)
            self.setAttributedTitle(attributedStr, for: .normal)
        }
    }
}
