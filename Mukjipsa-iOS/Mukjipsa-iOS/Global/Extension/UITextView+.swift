//
//  UITextView+.swift
//  Mukjipsa-iOS
//
//  Created by 강윤서 on 2022/11/07.
//

import UIKit

extension UITextView {
    /// 자간 설정 메서드
    func setletterSpacing(spacing: CGFloat) {
        let attributedStr = NSMutableAttributedString(string: self.text ?? "")
        attributedStr.addAttribute(NSAttributedString.Key.kern, value: spacing, range: NSMakeRange(0, attributedStr.length))
        self.attributedText = attributedStr
    }
    
    /// 행간 설정 메서드
    func setLineSpacing(linespaicing: CGFloat) {
        if let text = self.text {
            let attributedStr = NSMutableAttributedString(string: text)
            let style = NSMutableParagraphStyle()
            style.lineSpacing = linespaicing
            attributedStr.addAttribute(NSAttributedString.Key.kern, value: style, range: NSMakeRange(0, attributedStr.length))
            self.attributedText = attributedStr
        }
    }
    
    /// 자간과 lineHieght를 모두 설정하는 메서드
    func setLineHeightAndletterSpacing(lineHeightMultiple: CGFloat = 1.5,
                                       letterSpacing: CGFloat = -0.02) {
        if let text = self.text {
            let attributedStr = NSMutableAttributedString(string: text)
            let style = NSMutableParagraphStyle()
            style.lineHeightMultiple = lineHeightMultiple
            attributedStr.addAttribute(NSMutableAttributedString.Key.kern, value: letterSpacing, range: NSMakeRange(0, attributedStr.length))
            self.attributedText = attributedStr
        }
    }
}
