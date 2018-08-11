//
//  DogosViewController+SetupViews.swift
//  Dogos
//
//  Created by Nathaniel SISON on 8/8/2018.
//  Copyright © 2018 Nathaniel Brion Sison. All rights reserved.
//

import UIKit
import SnapKit

extension DogosViewController {
    
    internal func setupViews() {
        self.title = "Dogos"
        self.navigationController?.navigationBar.isTranslucent = false
        
        //self.categoryPickerContainer.addSubview(self.fuck)
        self.categoryPickerContainer.addSubview(self.categoryPickerStackView)
        self.container.addSubview(self.categoryPickerContainer)
        self.container.addSubview(self.tableView)
        self.view.addSubview(self.container)
        
        setupContainer()
        setupCategoryPicker()
        setupTableView()
    }
    
    func setupContainer() {
        self.container.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
    }
    
    func setupCategoryPicker() {
        self.categoryPickerContainer.snp.makeConstraints { (make) in
            make.left.top.right.equalToSuperview()
            make.height.equalTo(55)
        }
        
        self.categoryPickerStackView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
    }
    
    func setupTableView() {
        self.tableView.snp.makeConstraints { (make) in
            make.left.bottom.right.equalToSuperview()
            make.top.top.equalTo(self.categoryPickerContainer.snp.bottom)
        }
    }
    
}
