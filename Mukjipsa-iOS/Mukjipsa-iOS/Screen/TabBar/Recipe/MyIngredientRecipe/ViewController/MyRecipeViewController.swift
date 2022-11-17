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
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: creteRecipeLayout())
        collectionView.backgroundColor = .clear
        return collectionView
    }()
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setLayout()
        registerCell()
//        setDataSource()
//        updateSnapshot()
        
        recipeCollectionView.dataSource = self
        recipeCollectionView.delegate = self
    }
    
    // MARK: - Custom Method
    
    private func registerCell() {
        RecipeCollectionViewCell.register(target: recipeCollectionView)
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
    
    private func creteRecipeLayout() -> UICollectionViewLayout {
        let fractionalWidth: CGFloat = 358
        let estimatedHeight: CGFloat = 355
        let itemSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .estimated(estimatedHeight))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 16, trailing: 0)
        let groupSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .estimated(estimatedHeight))
        let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitem: item, count: 1)
        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 16, bottom: 0, trailing: 16)
        let layout = UICollectionViewCompositionalLayout(section: section)
        return layout
    }
    
    private func setDataSource() {
        print("보이냐")
        dataSource = UICollectionViewDiffableDataSource<Section, RecipeModel>(collectionView: recipeCollectionView) { (collectionView, indexPath, itemIdentifier) -> UICollectionViewCell? in
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: RecipeCollectionViewCell.className, for: indexPath) as? RecipeCollectionViewCell else { return UICollectionViewCell() }
            print("아 ㅅㅂ 진짜")
            return cell
        }
    }
    
    private func updateSnapshot() {
        snapshot = NSDiffableDataSourceSnapshot<Section, RecipeModel>()
        snapshot.appendSections([.recipe])
        snapshot.appendItems(recipes, toSection: .recipe)
        dataSource.apply(snapshot, animatingDifferences: true, completion: nil)
    }
}

extension MyRecipeViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 15
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: RecipeCollectionViewCell.className, for: indexPath) as? RecipeCollectionViewCell else { return UICollectionViewCell() }
        return cell
    }
}
