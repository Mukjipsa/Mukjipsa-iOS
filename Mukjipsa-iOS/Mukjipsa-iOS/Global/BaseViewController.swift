//
//  BaseViewController.swift
//  Mukjipsa-iOS
//
//  Created by 황찬미 on 2022/11/07.
//

import UIKit

class BaseViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        bind()
    }
    
    func setUI() {
        view.backgroundColor = .white
    }
    
    func bind() {}
}
