//
//  getClassName.swift
//  Mukjipsa-iOS
//
//  Created by 강윤서 on 2022/11/09.
//

import UIKit

/**
 TVC, CVC, VC의 각 className을 String으로 가져올 수 있도록 연산 프로퍼티를 설정합니다.
 이 값들은 나중에 Identifier에 잘 써먹을 수 있습니다 ^__^
*/

extension NSObject {
    static var className: String {
        NSStringFromClass(self.classForCoder()).components(separatedBy: ".").last!
    }
    var className: String {
        NSStringFromClass(self.classForCoder).components(separatedBy: ".").last!
    }
}
