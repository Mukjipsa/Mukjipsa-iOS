//
//  Environmnet.swift
//  Mukjipsa-iOS
//
//  Created by 황찬미 on 2022/12/22.
//

import Foundation

struct Environment {
    static let nativeAppKey = (Bundle.main.infoDictionary?["NATIVE_APP_KEY"] as! String).replacingOccurrences(of: " ", with: "")
}
