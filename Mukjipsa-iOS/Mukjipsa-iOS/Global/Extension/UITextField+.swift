//
//  UITextField.swift
//  Mukjipsa-iOS
//
//  Created by 강윤서 on 2022/11/07.
//

import UIKit

extension UITextField {
    /// 자간과 lineHeight를 모두 조정하는 메서드
    func setletterSpacingAndlineHeight(lineHeightMultiple: CGFloat = 1.5,
                                       letterSpacing: CGFloat = -0.02) {
        if let text = self.text {
            let attributedStr = NSMutableAttributedString(string: text)
            let style = NSMutableParagraphStyle()
            style.lineHeightMultiple = lineHeightMultiple
            attributedStr.addAttribute(NSAttributedString.Key.kern, value: letterSpacing, range: NSMakeRange(0, text.count))
            self.attributedText = attributedStr
        }
    }
}
