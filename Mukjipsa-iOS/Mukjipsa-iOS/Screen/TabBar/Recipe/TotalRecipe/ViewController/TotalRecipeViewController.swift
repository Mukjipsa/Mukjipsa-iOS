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
        
        recipeCollectionView.dataSource = self
        recipeCollectionView.delegate = self
    }
    
    // MARK: - Custom Method
    
    private func registerCell() {
        RecipeCollectionViewCell.register(target: recipeCollectionView)
        
        recipeCollectionView.register(RecipeHeaderView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: RecipeHeaderView.identifier)
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
    
    private func createSectionLayout() -> UICollectionViewLayout {
        return UICollectionViewCompositionalLayout { (sectionNumber, _) -> NSCollectionLayoutSection? in
            switch sectionNumber {
            case 0:
                return self.createRecipeLayout()
            default:
                return self.createRecipeLayout()
            }
        }
    }
    
    private func createRecipeLayout() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .estimated(375))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 16, trailing: 0)
        let groupSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .absolute(375))
        let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitem: item, count: 1)
        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 16, bottom: 0, trailing: 16)
        
        let headerSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .absolute(152))
        let header = NSCollectionLayoutBoundarySupplementaryItem(
            layoutSize: headerSize,
            elementKind: UICollectionView.elementKindSectionHeader,
            alignment: .top)

        section.boundarySupplementaryItems = [header]
        return section
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
