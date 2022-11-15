//
//  MeatAndSeaModel.swift
//  Mukjipsa-iOS
//
//  Created by 강윤서 on 2022/11/13.
//

import UIKit

struct ingredientModel {
    var ingredientName: String
}

var meatModelList: [ingredientModel] = [
    ingredientModel(ingredientName: "닭가슴살"),
    ingredientModel(ingredientName: "돼지 삽겹살"),
    ingredientModel(ingredientName: "돼지 목살"),
    ingredientModel(ingredientName: "소 등심"),
    ingredientModel(ingredientName: "소 안심"),
    ingredientModel(ingredientName: "훈제오리"),
    ingredientModel(ingredientName: "베이컨"),
    ingredientModel(ingredientName: "스팸"),
    ingredientModel(ingredientName: "비엔나소시지")
]

var seaModelList: [ingredientModel] = [
    ingredientModel(ingredientName: "다시마"),
    ingredientModel(ingredientName: "미역"),
    ingredientModel(ingredientName: "새우"),
    ingredientModel(ingredientName: "오징어"),
    ingredientModel(ingredientName: "바지락"),
    ingredientModel(ingredientName: "멸치"),
    ingredientModel(ingredientName: "고등어")
]
