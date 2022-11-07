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
            let attributedStr = NSMutableAttributedString(string: text)
            let style = NSMutableParagraphStyle()
            style.lineHeightMultiple = lineHieghtMultiple
            attributedStr.addAttribute(NSAttributedString.Key.kern, value: letterSpacing, range: NSMakeRange(0, text.count))
            self.setAttributedTitle(attributedStr, for: .normal)
        }
    }
}
