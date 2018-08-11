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
        
        self.container.addSubview(self.categoryPicker)
        self.container.addSubview(self.tableView)
        self.view.addSubview(self.container)
        
        self.container.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
        
        self.categoryPicker.snp.makeConstraints { (make) in
            make.left.top.right.equalToSuperview()
            make.height.equalTo(50)
        }
        
        self.tableView.snp.makeConstraints { (make) in
            make.left.bottom.right.equalToSuperview()
            make.top.top.equalTo(self.categoryPicker.snp.bottom)
        }
    }
    
}
