//
//  RecipeTableViewCell.swift
//  Mukjipsa-iOS
//
//  Created by 황찬미 on 2022/11/11.
//

import UIKit

import SnapKit
import Then

final class RecipeCollectionViewCell: UICollectionViewCell, UICollectionViewRegisterable {
    
    // MARK: - Property

    static var isFromNib: Bool = false
    
    // MARK: - UI Property
    
    private lazy var recipeCollectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: createTagLayout())
        collectionView.backgroundColor = .clear
        return collectionView
    }()
    
    private let recipeImage = UIView().then {
        $0.backgroundColor = .green
    }
    private let recipeContainerView = UIView()
    private let recipeName = UILabel().then {
        $0.text = "수제버거"
        $0.font = .h1
        $0.textColor = .dark
        $0.setLineHeightAndletterSpacing(Constant.fontSize.h1, Constant.LetterSpacing.h1)
    }
    
    private let recipeIc = UILabel().then {
        $0.text = "아이콘"
        $0.font = .b3
        $0.textColor = .gray2
        $0.setLineHeightAndletterSpacing(Constant.fontSize.b3, Constant.LetterSpacing.b3)
    }
    private let channelName = UILabel().then {
        $0.text = "채널 이름"
        $0.font = .b3
        $0.textColor = .gray2
        $0.setLineHeightAndletterSpacing(Constant.fontSize.b3, Constant.LetterSpacing.b3)
    }
    
    private let channelSite = UILabel().then {
        $0.text = "• YouTube"
        $0.font = .b4
        $0.textColor = .gray3
        $0.setLineHeightAndletterSpacing(Constant.fontSize.b4, Constant.LetterSpacing.b4)
    }
    
    private lazy var channelStackView = UIStackView().then {
        $0.axis = .horizontal
        $0.alignment = .center
        $0.distribution = .equalSpacing
        $0.spacing = 4
    }
    
    private lazy var recipeStackView = UIStackView().then {
        $0.axis = .vertical
        $0.alignment = .leading
        $0.distribution = .equalSpacing
        $0.spacing = 2
    }
    
    // MARK: - Life Cycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setLayout()
        setCellEffect()
        setDelegate()
        registerCell()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Custom Method
    
    private func setCellEffect() {
        self.layer.cornerRadius = 20
        self.layer.shadowOpacity = 1
        self.layer.borderWidth = 0.01
        self.layer.masksToBounds = true
        self.layer.applySketchShadow(color: .black, alpha: 0.1, x: 0.0, y: 0.0, blur: 10.0, spread: 0.0)
    }
    
    private func setDelegate() {
        recipeCollectionView.delegate = self
        recipeCollectionView.dataSource = self
    }
    
    private func registerCell() {
        RecipeTagCell.register(target: recipeCollectionView)
    }
    
    private func setLayout() {
        contentView.addSubview(recipeContainerView)
        channelStackView.addArrangedSubview(recipeIc)
        channelStackView.addArrangedSubview(channelName)
        channelStackView.addArrangedSubview(channelSite)
        recipeStackView.addArrangedSubview(recipeName)
        recipeStackView.addArrangedSubview(channelStackView)
        recipeContainerView.addSubviews([recipeImage, recipeStackView, recipeCollectionView])
        
        recipeContainerView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        recipeImage.snp.makeConstraints {
            $0.leading.top.trailing.equalToSuperview()
            $0.height.equalTo(201)
        }
        
        recipeStackView.snp.makeConstraints {
            $0.top.equalTo(recipeImage.snp.bottom).offset(16)
            $0.leading.equalToSuperview().inset(16)
        }
        
        recipeCollectionView.snp.makeConstraints {
            $0.top.equalTo(recipeStackView.snp.bottom).offset(13)
            $0.leading.trailing.equalToSuperview().inset(16)
            $0.bottom.equalToSuperview().inset(16)
            $0.height.equalTo(58)
        }
    }
    
    private func createTagLayout() -> UICollectionViewLayout {
        let estimatedWidth: CGFloat = 80
        let absoluteHeight: CGFloat = 25
        let itemSize = NSCollectionLayoutSize(
            widthDimension: .estimated(estimatedWidth),
            heightDimension: .absolute(absoluteHeight))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        let groupSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .absolute(absoluteHeight))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        group.interItemSpacing = .fixed(4)
        let section = NSCollectionLayoutSection(group: group)
        section.interGroupSpacing = 8
        let layout = UICollectionViewCompositionalLayout(section: section)
        return layout
    }
}

extension RecipeCollectionViewCell: UICollectionViewDelegate {

}

extension RecipeCollectionViewCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let recipeCell = collectionView.dequeueReusableCell(withReuseIdentifier: RecipeTagCell.className, for: indexPath) as? RecipeTagCell else { return UICollectionViewCell() }
        return recipeCell
    }
}
