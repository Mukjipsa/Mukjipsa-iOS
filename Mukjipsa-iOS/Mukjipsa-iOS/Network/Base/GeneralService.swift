//
//  GeneralService.swift
//  Mukjipsa-iOS
//
//  Created by 황찬미 on 2022/10/30.
//

import Foundation

struct GeneralService {
    private init() {}
    
    static func judgeStatus<T: Codable> (by statusCode: Int, data: Data, type: T.Type) -> NetworkResult<Any> {
        let decoder = JSONDecoder()

        guard let decodedData = try? decoder.decode(type.self, from: data) else { return .pathErr }
        
        switch statusCode {
        case 200:
            return .success(decodedData)
        case 201..<300:
            return .success(decodedData)
        case 400..<500:
            return .requestErr(decodedData)
        case 500:
            return .serverErr
        default:
            return .networkFail
        }
    }
}
