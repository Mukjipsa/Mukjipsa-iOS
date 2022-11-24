//
//  SearchEmptyViewController.swift
//  Mukjipsa-iOS
//
//  Created by 황찬미 on 2022/11/23.
//

import UIKit

import SnapKit
import Then

final class SearchEmptyViewController: BaseViewController {
    
    // MARK: - UI Property
    
    let searchEmptyView = EmptyView()
    let searchHeaderView = SearchHeaderView()
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setLayout()
        setDelegate()
    }
    
    // MARK: - Custom Method
    
    private func setDelegate() {
        searchHeaderView.searchTextField.delegate = self
    }
    
    private func setLayout() {
        searchEmptyView.emptyMode = .searchEmpty
        view.addSubviews([searchHeaderView, searchEmptyView])
        
        searchHeaderView.snp.makeConstraints {
            $0.top.leading.trailing.equalTo(view.safeAreaLayoutGuide)
            $0.height.equalTo(44)
        }
        
        searchEmptyView.snp.makeConstraints {
            $0.top.equalTo(searchHeaderView.snp.bottom)
            $0.leading.trailing.bottom.equalToSuperview()
        }
    }
}

    // MARK: - UITextFieldDelegate
extension SearchEmptyViewController: UITextFieldDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField) {
        searchHeaderView.placeholder.isHidden = true
        searchHeaderView.searchTextField.setLineHeightAndletterSpacing(Constant.fontSize.sh2, Constant.LetterSpacing.sh2)
        searchHeaderView.searchTextField.textColor = .dark
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        if searchHeaderView.searchTextField.text?.isEmpty == true {
            searchHeaderView.placeholder.isHidden = false
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
}
