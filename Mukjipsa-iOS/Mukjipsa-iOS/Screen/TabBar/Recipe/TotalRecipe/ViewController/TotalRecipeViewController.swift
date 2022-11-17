//
//  TotalRecipeViewController.swift
//  Mukjipsa-iOS
//
//  Created by 황찬미 on 2022/11/18.
//

import UIKit

import SnapKit
import Then

final class TotalRecipeViewController: BaseViewController {
    
    // MARK: - UI Property
    private let mainNaviView = RecipeNaviView(frame: CGRect(), mode: .mainRecipe)
    private lazy var recipeCollectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: createSectionLayout())
        collectionView.backgroundColor = .clear
        return collectionView
    }()
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setLayout()
        registerCell()
        setDelegate()
    }
    
    // MARK: - Custom Method
    
    private func registerCell() {
        RecipeCollectionViewCell.register(target: recipeCollectionView)
        
        recipeCollectionView.register(RecipeHeaderView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: RecipeHeaderView.identifier)
    }
    
    private func setDelegate() {
        recipeCollectionView.dataSource = self
        recipeCollectionView.delegate = self
    }
    
    private func setLayout() {
        view.addSubviews([mainNaviView, recipeCollectionView])
        
        mainNaviView.snp.makeConstraints {
            $0.leading.top.trailing.equalTo(view.safeAreaLayoutGuide)
            $0.height.equalTo(44)
        }
        
        recipeCollectionView.snp.makeConstraints {
            $0.top.equalTo(mainNaviView.snp.bottom)
            $0.leading.trailing.bottom.equalToSuperview()
        }
    }
}

extension TotalRecipeViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 15
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: RecipeCollectionViewCell.className, for: indexPath) as? RecipeCollectionViewCell else { return UICollectionViewCell() }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        switch kind {
        case UICollectionView.elementKindSectionHeader:
            guard let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: RecipeHeaderView.identifier, for: indexPath) as? RecipeHeaderView else { return UICollectionReusableView() }
            header.recipeHeader = .totalRecipe
            return header
        default:
            return UICollectionReusableView()
        }
    }
}
