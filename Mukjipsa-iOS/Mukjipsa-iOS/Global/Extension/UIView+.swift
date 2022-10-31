//
//  UIView+.swift
//  Mukjipsa-iOS
//
//  Created by 황찬미 on 2022/10/29.
//

import UIKit

extension UIView {
    func addSubviews(_ views: [UIView]) {
        views.forEach { self.addSubview($0) }
    }
}
