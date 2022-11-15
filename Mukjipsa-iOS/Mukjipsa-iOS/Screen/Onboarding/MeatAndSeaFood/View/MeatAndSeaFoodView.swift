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
    // MARK: - UI Components
    private let naviView = OnboardingNaviView()
    private let progressBarImageView = ProgressBarImageView()
    private var titleView = OnboardingTitleView()
//    private var collectionViewSectionHeader = OnboardingCollectionViewSectionHeader()
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
        titleView.viewType = .meat
        nextButton.setTitle(Constant.String.Onboarding.nextButton, for: .normal)
    }
    
    override func setLayout() {
        addSubviews([naviView, progressBarImageView, titleView, ingredientCollectionView, nextButton])
        
        naviView.snp.makeConstraints {
            $0.directionalHorizontalEdges.top.equalToSuperview()
            $0.height.equalTo(44)
        }
        
        progressBarImageView.snp.makeConstraints {
            $0.height.equalTo(36)
            $0.top.equalTo(naviView.snp.bottom).offset(16)
            $0.directionalHorizontalEdges.equalToSuperview()
        }
        
        titleView.snp.makeConstraints {
            $0.top.equalTo(progressBarImageView.snp.bottom).offset(16)
            $0.leading.equalToSuperview().offset(16)
            $0.height.equalTo(65)
        }
        
        ingredientCollectionView.snp.makeConstraints {
            $0.top.equalTo(titleView.snp.bottom).offset(28)
            $0.directionalHorizontalEdges.equalToSuperview()
            $0.bottom.equalTo(nextButton.snp.top).offset(-52)
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
    }
    
    private func setDelegate() {
        ingredientCollectionView.delegate = self
        ingredientCollectionView.dataSource = self
    }
    
    private func createSectionLayout() -> UICollectionViewCompositionalLayout {
        return UICollectionViewCompositionalLayout { (sectionNum, _) -> NSCollectionLayoutSection? in
            switch sectionNum {
            case 0:
//                self.collectionViewSectionHeader.configure(.meat)
                return self.createLayout()
            case 1:
//                self.collectionViewSectionHeader.configure(.sea)
                return self.createLayout()
            default:
                return self.createLayout()
            }
        }
    }
    
    private func createLayout() -> NSCollectionLayoutSection {
        let ingredientCellWidth: CGFloat = 81
        let ingredientCellHeight: CGFloat = 36

        let itemSize = NSCollectionLayoutSize(
            widthDimension: .estimated(ingredientCellWidth),
            heightDimension: .absolute(ingredientCellHeight))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.edgeSpacing = NSCollectionLayoutEdgeSpacing(leading: .fixed(8), top: nil, trailing: nil, bottom: nil)

        let groupSize = NSCollectionLayoutSize(
            widthDimension: .absolute(358),
            heightDimension: .absolute(36))
        let group = NSCollectionLayoutGroup.horizontal(
            layoutSize: groupSize,
            subitems: [item])

        let section = NSCollectionLayoutSection(group: group)
        section.interGroupSpacing = 10
        
//        let headerSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .absolute(50))
//        let header = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: headerSize, elementKind: collectionViewSectionHeader.className, alignment: .bottomLeading)
//        section.boundarySupplementaryItems = [header]
        return section
    }
}

extension MeatAndSeaFoodView: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch section {
        case 0:
            return meatModelList.count
        case 1:
            return seaModelList.count
        default:
            return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let ingredientCell = collectionView.dequeueReusableCell(
            withReuseIdentifier: OnboardingCollectionViewCell.className,
            for: indexPath) as? OnboardingCollectionViewCell else { return UICollectionViewCell()}
        switch indexPath.section {
        case 0:
//            self.collectionViewSectionHeader.viewType = .meat
            ingredientCell.configure(meatModelList[indexPath.row])
        case 1:
//            self.collectionViewSectionHeader.viewType = .sea
            ingredientCell.configure(seaModelList[indexPath.row])
        default:
            return UICollectionViewCell()
        }
        return ingredientCell
    }
}
