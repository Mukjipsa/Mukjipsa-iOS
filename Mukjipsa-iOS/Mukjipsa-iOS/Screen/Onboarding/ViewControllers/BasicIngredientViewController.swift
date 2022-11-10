//
//  BasicIngredientViewController.swift
//  Mukjipsa-iOS
//
//  Created by 강윤서 on 2022/11/08.
//

import UIKit

import SnapKit
import Then

final class BasicIngredientViewController: BaseViewController {

    //MARK: UIComponents
    private let basicIngredientView = BasicIngredientView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setLayout()
    }
    
}

extension BasicIngredientViewController {
    private func setLayout() {
        view.addSubview(basicIngredientView)
        
        basicIngredientView.snp.makeConstraints{
            $0.edges.equalTo(view.safeAreaLayoutGuide)
        }
    }
}
