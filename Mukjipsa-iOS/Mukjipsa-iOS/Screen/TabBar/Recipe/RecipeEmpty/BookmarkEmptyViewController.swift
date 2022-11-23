//
//  BookmarkEmptyViewController.swift
//  Mukjipsa-iOS
//
//  Created by 황찬미 on 2022/11/23.
//

import UIKit

final class BookmarkEmptyViewController: BaseViewController {
    
    // MARK: - Property
    
    // MARK: - UI Property
    
    let bookmarkNaviView = RecipeNaviView(frame: .zero, mode: .bookmark)
    let bookmarkEmptyView = EmptyView()
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setLayout()
    }
    
    // MARK: - @objc
    
    private func setLayout() {
        bookmarkEmptyView.emptyMode = .bookmarkEmpty
        view.addSubviews([bookmarkNaviView, bookmarkEmptyView])
        
        bookmarkNaviView.snp.makeConstraints {
            $0.top.leading.trailing.equalTo(view.safeAreaLayoutGuide)
            $0.height.equalTo(44)
        }
        
        bookmarkEmptyView.snp.makeConstraints {
            $0.top.equalTo(bookmarkNaviView.snp.bottom)
            $0.leading.trailing.bottom.equalToSuperview()
        }
    }
    
    // MARK: - Custom Method

}
