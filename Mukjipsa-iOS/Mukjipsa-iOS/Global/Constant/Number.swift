//
//  LetterSpacing.swift
//  Mukjipsa-iOS
//
//  Created by 강윤서 on 2022/11/07.
//

import UIKit

extension Constant {
    static let spacing = -0.02
    static let lineHeight = 1.25
    
    struct fontSize {
        // fontSize
        static let t1: CGFloat = 25
        static let h1: CGFloat = 20
        static let h2: CGFloat = 18
        static let h3: CGFloat = 20
        static let sh1: CGFloat = 25
        static let sh2: CGFloat = 16
        
        static let bu1: CGFloat = 16
        static let bu2: CGFloat = 14
        static let b1: CGFloat = 13
        static let b2: CGFloat = 14
        static let b3: CGFloat = 13
        static let b4: CGFloat = 13
        static let b5: CGFloat = 10
    }
    
    struct LetterSpacing {
        // Title & Heading
        static let t1: CGFloat = Constant.fontSize.t1 * spacing
        static let h1: CGFloat = Constant.fontSize.h1 * spacing
        static let h2: CGFloat = Constant.fontSize.h2 * spacing
        static let h3: CGFloat = Constant.fontSize.h3 * spacing
        static let sh1: CGFloat = Constant.fontSize.sh1 * spacing
        static let sh2: CGFloat = Constant.fontSize.sh2 * spacing
        
        // Body
        static let bu1 = Constant.fontSize.bu1 * spacing
        static let bu2 = Constant.fontSize.bu2 * spacing
        static let b1 = Constant.fontSize.b1 * spacing
        static let b2 = Constant.fontSize.b2 * spacing
        static let b3 = Constant.fontSize.b3 * spacing
        static let b4 = Constant.fontSize.b4 * spacing
        static let b5 = Constant.fontSize.b5 * spacing
    }
    
}
