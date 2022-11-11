//
//  RecipeViewController.swift
//  Mukjipsa-iOS
//
//  Created by 황찬미 on 2022/11/01.
//

import UIKit

import SnapKit
import Then

final class MyRecipeViewController: BaseViewController {
    
    // MARK: - Property
    
    // MARK: - UI Property
    
    private let mainNaviView = RecipeNaviView(frame: CGRect(), mode: .mainRecipe)
    private lazy var recipeTableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.backgroundColor = .clear
        tableView.separatorStyle = .none
        tableView.showsVerticalScrollIndicator = false
        return tableView
    }()
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setLayout()
        registerCell()
        setDelegate()
    }
    
    // MARK: - Custom Method
    private func setLayout() {
        view.addSubviews([mainNaviView, recipeTableView])
        
        mainNaviView.snp.makeConstraints {
            $0.leading.top.trailing.equalTo(view.safeAreaLayoutGuide)
            $0.height.equalTo(44)
        }
        
        recipeTableView.snp.makeConstraints {
            $0.top.equalTo(mainNaviView.snp.bottom)
            $0.leading.trailing.equalToSuperview().inset(16)
            $0.bottom.equalToSuperview()
        }
    }
    
    private func registerCell() {
        RecipeTableViewCell.register(target: recipeTableView)
    }
    
    private func registerSectionHeader() {
        recipeTableView.register(UITableViewHeaderFooterView.self, forHeaderFooterViewReuseIdentifier: RecipeHeaderView.className)
    }

    private func setDelegate() {
        recipeTableView.delegate = self
        recipeTableView.dataSource = self
    }
    
    override func bind() {}
}

extension MyRecipeViewController: UITableViewDelegate {
    
}

extension MyRecipeViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 15
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let recipeCell = tableView.dequeueReusableCell(withIdentifier: RecipeTableViewCell.className, for: indexPath) as? RecipeTableViewCell else { return UITableViewCell() }
        return recipeCell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 355
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return RecipeHeaderView(reuseIdentifier: RecipeHeaderView.className, mode: .totalRecipe)
    }
}
