//
//  UILabel+.swift
//  Mukjipsa-iOS
//
//  Created by 강윤서 on 2022/11/07.
//

import UIKit

extension UILabel {
    /// 자간 조정 메서드
    func setletterSpacing(_ spacing: CGFloat) {
        let attributedStr = NSMutableAttributedString(string: self.text ?? "")
        attributedStr.addAttribute(NSAttributedString.Key.kern, value: spacing, range: NSRange(location: 0, length: attributedStr.length))
        self.attributedText = attributedStr
    }
    
    /// 행간 조정 메서드
    func setLineSpacing(_ lineSpacing: CGFloat) {
        if let text = self.text {
            let attributedStr = NSMutableAttributedString(string: text)
            let style = NSMutableParagraphStyle()
            style.lineSpacing = lineSpacing
            attributedStr.addAttribute(NSAttributedString.Key.paragraphStyle, value: style, range: NSRange(location: 0, length: attributedStr.length))
            self.attributedText = attributedStr
        }
    }
    
    /// lineHeight를 조정하는 메서드
    func setTextWithLineHeight(lineHeightMultiple: CGFloat) {
        if let text = self.text {
            let style = NSMutableParagraphStyle()
            style.lineHeightMultiple = lineHeightMultiple
            
            let attributes: [NSAttributedString.Key: Any] = [
                .paragraphStyle: style
            ]
            
            let attrString = NSAttributedString(string: text,
                                                attributes: attributes)
            self.attributedText = attrString
        }
    }
    
    /// 자간과 lineHeight를 모두 조정하는 메서드
    func setLineHeightAndletterSpacing(lineHeightMultiple: CGFloat = 1.5,
                                       letterSpacing: CGFloat = -0.02) {
        if let text = self.text {
            let style = NSMutableParagraphStyle()
            style.lineHeightMultiple = lineHeightMultiple
            let attributes: [NSAttributedString.Key: Any] = [
                .paragraphStyle: style,
                .kern: letterSpacing
            ]
            let attributedStr = NSMutableAttributedString(string: text,
                                                          attributes: attributes)
            
            self.attributedText = attributedStr
        }
    }
}
