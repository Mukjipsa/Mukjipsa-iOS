//
//  UITextField.swift
//  Mukjipsa-iOS
//
//  Created by 강윤서 on 2022/11/07.
//

import UIKit

extension UITextField {
    /// 자간과 lineHeight를 모두 조정하는 메서드, lineHeight 1.5로 고정
    func setLineHeightAndletterSpacing(_ fontSize: CGFloat, _ letterSpacing: CGFloat = -0.02) {
        if let text = self.text {
            let style = NSMutableParagraphStyle()
            style.lineHeightMultiple = Constant.lineHeight
            let attributes: [NSAttributedString.Key: Any] = [
                .paragraphStyle: style,
                .kern: letterSpacing,
                .baselineOffset: (fontSize * Constant.lineHeight - fontSize) / 4
            ]
            
            let attributedStr = NSMutableAttributedString(string: text,
                                                          attributes: attributes)
            
            self.attributedText = attributedStr
        }
    }
    
    func addLeftPadding() {
      let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 20, height: self.frame.height))
      self.leftView = paddingView
      self.leftViewMode = ViewMode.always
    }
}
