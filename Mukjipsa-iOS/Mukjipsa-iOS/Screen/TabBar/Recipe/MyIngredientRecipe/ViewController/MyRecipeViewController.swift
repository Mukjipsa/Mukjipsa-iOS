//
//  MyIngredientRecipeViewController.swift
//  Mukjipsa-iOS
//
//  Created by 황찬미 on 2022/11/16.
//

import UIKit

import SnapKit
import Then

enum Section: CaseIterable {
    case recipe
}

final class MyRecipeViewController: BaseViewController {
    
    // MARK: - Property
    
    private var dataSource: UICollectionViewDiffableDataSource<Section, RecipeModel>!
    private var snapshot: NSDiffableDataSourceSnapshot<Section, RecipeModel>!
    private var recipes: [RecipeModel] = []
    
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
    
//    private func setDataSource() {
//        print("보이냐")
//        dataSource = UICollectionViewDiffableDataSource<Section, RecipeModel>(collectionView: recipeCollectionView) { (collectionView, indexPath, itemIdentifier) -> UICollectionViewCell? in
//            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: RecipeCollectionViewCell.className, for: indexPath) as? RecipeCollectionViewCell else { return UICollectionViewCell() }
//            return cell
//        }
//    }
//
//    private func updateSnapshot() {
//        snapshot = NSDiffableDataSourceSnapshot<Section, RecipeModel>()
//        snapshot.appendSections([.recipe])
//        snapshot.appendItems(recipes, toSection: .recipe)
//        dataSource.apply(snapshot, animatingDifferences: true, completion: nil)
//    }
//}

extension MyRecipeViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
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
            header.recipeHeader = .myRecipe
            return header
        default:
            return UICollectionReusableView()
        }
    }
}
