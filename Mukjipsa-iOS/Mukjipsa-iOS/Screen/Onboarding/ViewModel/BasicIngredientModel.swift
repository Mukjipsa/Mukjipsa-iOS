//
//  BasicIngredientModel.swift
//  Mukjipsa-iOS
//
//  Created by 강윤서 on 2022/11/09.
//

import UIKit

struct BasicIngredientModel {
    var ingredientImage: UIImage?
    var category: String
    var ingredientName: String
}

var basicIngredientModelList: [BasicIngredientModel] = [
    BasicIngredientModel(category: "육류", ingredientName: "스팸"),
    BasicIngredientModel(category: "채소", ingredientName: "대파"),
    BasicIngredientModel(category: "채소", ingredientName: "양파"),
    BasicIngredientModel(category: "채소", ingredientName: "마늘"),
    BasicIngredientModel(category: "소스/조미료", ingredientName: "간장"),
    BasicIngredientModel(category: "소스/조미료", ingredientName: "소금"),
    BasicIngredientModel(category: "소스/조미료", ingredientName: "설탕"),
    BasicIngredientModel(category: "알류", ingredientName: "계란"),
    BasicIngredientModel(category: "기타", ingredientName: "김치"),
    BasicIngredientModel(category: "곡류", ingredientName: "즉석밥"),
]
