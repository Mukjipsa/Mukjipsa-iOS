//
//  Image.swift
//  Mukjipsa-iOS
//
//  Created by 황찬미 on 2022/11/04.
//

import UIKit

extension Constant {
    struct Image {
        static let bookmark = UIImage(named: "bookmark")!
        static let bookmarkSelected = UIImage(named: "bookmarkSelected")!
        static let backButton = UIImage(named: "icBack")
        
        struct Auth {
            static let logoImage = UIImage(named: "imgLogo")
            static let kakaoLogin = UIImage(named: "kakaoLoginButton")
        }
        
        struct Splash {
            static let MJSlogo = UIImage(named: "MJSlogo")
        }
        
        struct Onboarding {
            static let progressBarImageOne = UIImage(named: "progressBarOne")
            static let progressBarImageTwo = UIImage(named: "progressBarTwo")
            static let progressBarImageThree = UIImage(named: "progressBarThree")
            static let progressBarImageFour = UIImage(named: "progressBarFour")
            static let checkIcon = UIImage(named: "icCheck")
        }
    }
}
