//
//  String.swift
//  Mukjipsa-iOS
//
//  Created by 강윤서 on 2022/11/08.
//

import Foundation

extension Constant {
    struct String {
        struct Onboarding {
            static let doItLater = "나중에 할게요"
            static let selectMessage = "기본 재료를 선택해요!"
            static let subSelectMessage =
            """
            기본적인 재료 10가지를 먼저 보여드릴게요
            내가 가진 재료만 선택해볼까요?
            """
            
            static let basic = "기본 재료"
            static let meatAndSeafood = "육류/해산물"
            static let vegetableAndGrain = "채소/곡류"
            static let saurce = "소스/조미료"
            static let etc = "기타"
            
            static let nextButton = "다음"
            static let finishButton = "완료"
        }
    }
}
