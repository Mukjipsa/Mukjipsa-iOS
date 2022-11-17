//
//  BasicIngredient.swift
//  Mukjipsa-iOS
//
//  Created by 강윤서 on 2022/11/08.
//

import UIKit

import SnapKit
import Then

class BasicIngredientView: BaseView {
    
    // MARK: - UIComponents
    
    private let naviView = OnboardingNaviView()
    private let basicTitleLabel = UILabel()
    private let basicSubTitleLabel = UILabel()
    private lazy var ingredientCollectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: self.bounds, collectionViewLayout: createLayout())
        return collectionView
    }()
    private let finishButton = MJSButton()
    
    // MARK: - Life Cycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        registerCell()
        setDelegate()
    }
    
    override func setUI() {
        naviView.viewType = .basic
        
        basicTitleLabel.do {
            $0.text = Constant.String.Onboarding.selectMessage
            $0.font = .sh1
            $0.setLineHeightAndletterSpacing(Constant.fontSize.sh1, Constant.LetterSpacing.sh1)
            $0.textColor = .black
        }
        
        basicSubTitleLabel.do {
            $0.text = Constant.String.Onboarding.subSelectMessage
            $0.font = .sh2
            $0.setLineHeightAndletterSpacing(Constant.fontSize.sh2, Constant.LetterSpacing.sh2)
            $0.textColor = UIColor(red: 118.0/255.0, green: 124.0/255.0, blue: 141.0/255.0, alpha: 1.0)
            $0.numberOfLines = 2
        }
        
        finishButton.do {
            $0.setTitle(Constant.String.Onboarding.finishButton, for: .normal)
        }
    }
    
    override func setLayout() {
        addSubviews([naviView, basicTitleLabel, basicSubTitleLabel, ingredientCollectionView, finishButton])
        
        naviView.snp.makeConstraints {
            $0.top.equalTo(safeAreaLayoutGuide)
            $0.directionalHorizontalEdges.equalToSuperview()
            $0.height.equalTo(44)
        }
        
        basicTitleLabel.snp.makeConstraints {
            $0.top.equalTo(naviView.snp.bottom).offset(24)
            $0.leading.equalToSuperview().inset(16)
        }
        
        basicSubTitleLabel.snp.makeConstraints {
            $0.top.equalTo(basicTitleLabel.snp.bottom).offset(8)
            $0.leading.equalTo(basicTitleLabel.snp.leading)
        }
        
        ingredientCollectionView.snp.makeConstraints {
            $0.top.equalTo(basicSubTitleLabel.snp.bottom).offset(48)
            $0.directionalHorizontalEdges.equalToSuperview().inset(16)
            $0.bottom.equalTo(finishButton.snp.top).offset(72)
        }

        finishButton.snp.makeConstraints {
            $0.directionalHorizontalEdges.equalToSuperview().inset(16)
            $0.height.equalTo(56)
            $0.bottom.equalToSuperview().inset(8)
        }
    }
}

extension BasicIngredientView {
    private func registerCell() {
        BasicIngredientCollectionViewCell.register(target: ingredientCollectionView)
    }
    
    private func setDelegate() {
        ingredientCollectionView.delegate = self
        ingredientCollectionView.dataSource = self
    }
    
    private func createLayout() -> UICollectionViewLayout {
        let ingredientCellWidth: CGFloat = 175
        let ingredientCellHeight: CGFloat = 77
        let itemSize = NSCollectionLayoutSize(
            widthDimension: .absolute(ingredientCellWidth),
            heightDimension: .absolute(ingredientCellHeight))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 8, bottom: 0, trailing: 0)
        let groupSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1),
            heightDimension: .absolute(ingredientCellHeight))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        let section = NSCollectionLayoutSection(group: group)
        section.interGroupSpacing = 8
        let layout = UICollectionViewCompositionalLayout(section: section)
        return layout
    }
}

extension BasicIngredientView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return basicIngredientModelList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let ingredientCell = collectionView.dequeueReusableCell(
            withReuseIdentifier: BasicIngredientCollectionViewCell.className,
            for: indexPath) as? BasicIngredientCollectionViewCell else { return UICollectionViewCell()}
        ingredientCell.configure(basicIngredientModelList[indexPath.row])
        return ingredientCell
    }
}

extension BasicIngredientView: UICollectionViewDelegate {
    
}
