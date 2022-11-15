//
//  MeatAndSeaFoodViewController.swift
//  Mukjipsa-iOS
//
//  Created by 강윤서 on 2022/11/13.
//

import UIKit

class MeatAndSeaFoodViewController: BaseViewController {
    // MARK: - UI Components
    private let meatAndSeaFoodView = MeatAndSeaFoodView()
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setLayout()
    }

}

extension MeatAndSeaFoodViewController {
    private func setLayout() {
        view.addSubview(meatAndSeaFoodView)
        
        meatAndSeaFoodView.snp.makeConstraints {
            $0.edges.equalTo(view.safeAreaLayoutGuide)
        }
    }
}
