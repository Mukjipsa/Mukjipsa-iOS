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
            static let subSelectMessage = """
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
            
            static let guideMessage = """
                                      내가 가진 재료로
                                      어떤 요리를 할 수 있을까요?
                                      """
            static let subGuideMessage = """
                                         먹집사는 나의 냉장고 안의 식재료로
                                         만들 수 있는 요리를 추천해드려요
                                         """
            static let gotoMessage = "그럼, 식재료를 입력하러 가볼까요?"
            static let gotoButton = "간단한 식재료 입력하기"
            
            static let finishMessage = "재료를 모두 입력했어요!"
            static let subFinishMessage = """
                                          나의 재료로 바로 요리할 수 있는
                                          맞춤 레시피를 알려드릴게요
                                          """
            static let gotoMyRecipe = "맞춤 레시피 보러가기"
            static let selectHaveIngredient = "가지고 있는 재료를 선택해요!"
        }
        
        struct Alert {
            static let laterTitle = "나중에 하실건가요?"
            static let laterExplain = "지금, 더 간단한 식재료 입력을 도와드려요!"
            static let laterButton = "나중에 하기"
            static let finishBasicTitle = "계속해볼까요?"
            static let finishBasicExplain = """
                                            기본 재료 입력을 완료했어요!
                                            계속해서 더 간단한 식재료를 입력해요
                                            """
            static let doitNowButton = "지금 하기"
            static let continueButton = "계속 하기"
        }
        
        struct Recipe {
            static let myIngredient = "나의 재료"
            static let bookmark = "북마크"
        }
    }
}
