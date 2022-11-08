//
//  BaseView.swift
//  Mukjipsa-iOS
//
//  Created by 황찬미 on 2022/11/07.
//

import UIKit

class BaseView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        setUI()
        setLayout()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setUI() {}
    func setLayout() {}
}
