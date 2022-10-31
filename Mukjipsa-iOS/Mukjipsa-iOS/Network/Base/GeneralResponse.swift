//
//  GeneralResponse.swift
//  Mukjipsa-iOS
//
//  Created by 황찬미 on 2022/10/30.
//

import Foundation

struct GeneralResponse<T: Codable>: Codable {
    var status: Int
    var success: Bool?
    var message: String?
    var data: T?
}
