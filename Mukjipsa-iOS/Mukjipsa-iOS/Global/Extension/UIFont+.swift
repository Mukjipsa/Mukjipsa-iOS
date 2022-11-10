//
//  UIFont+.swift
//  Mukjipsa-iOS
//
//  Created by 강윤서 on 2022/11/04.
//

import UIKit

extension UIFont {
    //MARK: - Pretendard
    
    public enum PretendardType: String {
        case light = "Light"
        case mediun = "Mediun"
        case regular = "Regular"
        case semiBold = "SemiBold"
    }
    
    static func Pretandard(_ type: PretendardType, size: CGFloat) -> UIFont {
        return UIFont(name: "Pretendard-\(type.rawValue)", size: size)!
    }
}

//MARK: - Font StyleGuide
extension UIFont {
    // Title & Heading
    class var t1: UIFont {
        return UIFont(name: "Pretendard-SemiBold", size: 25.0)!
    }
    
    class var h1: UIFont {
        return UIFont(name: "Pretendard-SemiBold", size: 20.0)!
    }
    
    class var h2: UIFont {
        return UIFont(name: "Pretendard-SemiBold", size: 18.0)!
    }
    
    class var h3: UIFont {
        return UIFont(name: "Pretendard-Regular", size: 20.0)!
    }
    
    class var sh1: UIFont {
        return UIFont(name: "Pretendard-Light", size: 25.0)!
    }
    
    class var sh2: UIFont {
        return UIFont(name: "Pretendard-Regular", size: 16.0)!
    }
    
    // Body
    class var bu1: UIFont {
        return UIFont(name: "Pretendard-SemiBold", size: 16.0)!
    }
    
    class var b1: UIFont {
        return UIFont(name: "Pretendard-SemiBold", size: 13.0)!
    }
    
    class var b2: UIFont {
        return UIFont(name: "Pretendard-Regular", size: 14.0)!
    }
    
    class var b3: UIFont {
        return UIFont(name: "Pretendard-Regular", size: 13.0)!
    }
    
    class var b4: UIFont {
        return UIFont(name: "Pretendard-Light", size: 13.0)!
    }
    
    class var b5: UIFont {
        return UIFont(name: "Pretendard-Light", size: 10.0)!
    }
}
