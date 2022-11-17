//
//  MeatAndSeaFoodView.swift
//  Mukjipsa-iOS
//
//  Created by 강윤서 on 2022/11/10.
//

import UIKit

import SnapKit
import Then

class MeatAndSeaFoodView: BaseView, UICollectionViewDelegate {
    // MARK: - Properties
    
    // MARK: - UI Components
    private let naviView = OnboardingNaviView()
    private let progressBarImageView = ProgressBarImageView()
    private var collectionViewSectionFooter = OnboardingCollectionViewSectionFooter()
    private lazy var ingredientCollectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: createSectionLayout())
        return collectionView
    }()
    private let nextButton = MJSButton()
    
    // MARK: - Life Cycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        registerCell()
        setDelegate()
    }
    
    override func setUI() {
        naviView.viewType = .notBasic
        progressBarImageView.viewType = .One
        nextButton.setTitle(Constant.String.Onboarding.nextButton, for: .normal)
    }
    
    override func setLayout() {
        addSubviews([naviView, progressBarImageView, ingredientCollectionView, nextButton])
        
        naviView.snp.makeConstraints {
            $0.directionalHorizontalEdges.top.equalToSuperview()
            $0.height.equalTo(44)
        }
        
        progressBarImageView.snp.makeConstraints {
            $0.height.equalTo(36)
            $0.top.equalTo(naviView.snp.bottom).offset(16)
            $0.directionalHorizontalEdges.equalToSuperview()
        }

        ingredientCollectionView.snp.makeConstraints {
            $0.top.equalTo(progressBarImageView.snp.bottom).offset(16)
            $0.directionalHorizontalEdges.equalToSuperview().inset(16)
            $0.bottom.equalTo(nextButton.snp.top).offset(-8)
        }
        
        nextButton.snp.makeConstraints {
            $0.directionalHorizontalEdges.equalToSuperview().inset(16)
            $0.bottom.equalToSuperview().inset(8)
            $0.height.equalTo(56)
        }
    }
}

extension MeatAndSeaFoodView {
    private func registerCell() {
        OnboardingCollectionViewCell.register(target: ingredientCollectionView)
        OnboardingTitleViewCell.register(target: ingredientCollectionView)
        ingredientCollectionView.register(
            OnboardingCollectionViewSectionHeader.self,
            forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
            withReuseIdentifier: OnboardingCollectionViewSectionHeader.className)
        ingredientCollectionView.register(
            OnboardingCollectionViewSectionFooter.self,
            forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter,
            withReuseIdentifier: OnboardingCollectionViewSectionFooter.className)
    }
    
    private func setDelegate() {
        ingredientCollectionView.delegate = self
        ingredientCollectionView.dataSource = self
    }
    
    private func createSectionLayout() -> UICollectionViewCompositionalLayout {
        return UICollectionViewCompositionalLayout { (sectionNumber, _) -> NSCollectionLayoutSection? in
            switch sectionNumber {
            case 0:
                return self.createTitleLayout()
            default:
                return self.createLayout()
            }
        }
    }
    
    private func createTitleLayout() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1),
            heightDimension: .absolute(65))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        let groupSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1),
            heightDimension: .absolute(65))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])

        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 28, trailing: 0)
        
        return section
    }
    
    private func createLayout() -> NSCollectionLayoutSection {
        let ingredientCellWidth: CGFloat = 81
        let ingredientCellHeight: CGFloat = 36

        let itemSize = NSCollectionLayoutSize(
            widthDimension: .estimated(ingredientCellWidth),
            heightDimension: .absolute(ingredientCellHeight))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.edgeSpacing = NSCollectionLayoutEdgeSpacing(leading: nil, top: nil, trailing: .fixed(8), bottom: nil)

        let groupSize = NSCollectionLayoutSize(
            widthDimension: .absolute(358),
            heightDimension: .absolute(36))
        let group = NSCollectionLayoutGroup.horizontal(
            layoutSize: groupSize,
            subitems: [item])

        let section = NSCollectionLayoutSection(group: group)
        section.interGroupSpacing = 10
        
        let headerSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1),
            heightDimension: .absolute(30))
        let header = NSCollectionLayoutBoundarySupplementaryItem(
            layoutSize: headerSize,
            elementKind: UICollectionView.elementKindSectionHeader,
            alignment: .topLeading)
        
        let footerSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1),
            heightDimension: .absolute(64))
        let footer = NSCollectionLayoutBoundarySupplementaryItem(
            layoutSize: footerSize,
            elementKind: UICollectionView.elementKindSectionFooter,
            alignment: .bottomLeading)
        
        section.boundarySupplementaryItems = [header, footer]
        section.contentInsets = NSDirectionalEdgeInsets(top: 16, leading: 0, bottom: 0, trailing: 0)

        return section
    }
}

extension MeatAndSeaFoodView: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 3
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 1
        case 1:
            return meatModelList.count
        case 2:
            return seaModelList.count
        default:
            return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let titleCell = collectionView.dequeueReusableCell(withReuseIdentifier: OnboardingTitleViewCell.className, for: indexPath) as? OnboardingTitleViewCell else { return UICollectionViewCell() }
        guard let ingredientCell = collectionView.dequeueReusableCell(
            withReuseIdentifier: OnboardingCollectionViewCell.className,
            for: indexPath) as? OnboardingCollectionViewCell else { return UICollectionViewCell()}
        switch indexPath.section {
        case 0:
            titleCell.viewType = .meat
            return titleCell
        case 1:
            ingredientCell.configure(meatModelList[indexPath.row])
        case 2:
            ingredientCell.configure(seaModelList[indexPath.row])
        default:
            return UICollectionViewCell()
        }
        return ingredientCell
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        switch kind {
        case UICollectionView.elementKindSectionHeader:
            let header = collectionView.dequeueReusableSupplementaryView(
                ofKind: UICollectionView.elementKindSectionHeader,
                withReuseIdentifier: OnboardingCollectionViewSectionHeader.className,
                for: indexPath)
            return header
        case UICollectionView.elementKindSectionFooter:
            let footer = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: collectionViewSectionFooter.className, for: indexPath)
            footer.isHidden = indexPath.section == numberOfSections(in: ingredientCollectionView)-1
            return footer
        default:
            return UICollectionReusableView()
        }
    }
}
