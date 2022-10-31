//
//  UIScreen.swift
//  Mukjipsa-iOS
//
//  Created by 황찬미 on 2022/10/29.
//

import UIKit

extension UIScreen {
    var hasNotch: Bool {
        return !( (UIScreen.main.bounds.width / UIScreen.main.bounds.height) > 0.5 )
    }
}
