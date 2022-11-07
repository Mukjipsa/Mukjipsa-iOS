//
//  LetterSpacing.swift
//  Mukjipsa-iOS
//
//  Created by 강윤서 on 2022/11/07.
//

import UIKit

extension Constant {
    static let spacing = -0.02
    
    struct LetterSpacing {
        // Title & Heading
        static let t1: CGFloat = 25 * spacing
        static let h1: CGFloat = 20 * spacing
        static let h2: CGFloat = 18 * spacing
        static let h3: CGFloat = 20 * spacing
        static let sh1: CGFloat = 25 * spacing
        static let sh2: CGFloat = 16 * spacing
        
        // Body
        static let bu1 = 16 * spacing
        static let bu2 = 14 * spacing
        static let b1 = 13 * spacing
        static let b2 = 14 * spacing
        static let b3 = 13 * spacing
        static let b4 = 13 * spacing
        static let b5 = 10 * spacing
    }
}
