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
        setHierarchy()
        setConstraints()
    }
    
    func setUI() {
        view.backgroundColor = .white
    }
    
    func setHierarchy() {}
    func setConstraints() {}
}
