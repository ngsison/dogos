//
//  DogosVC+SetupViews.swift
//  Dogos
//
//  Created by Nathaniel SISON on 8/8/2018.
//  Copyright © 2018 Nathaniel Brion Sison. All rights reserved.
//

import UIKit
import SnapKit

extension DogosVC {
    
    internal func initViews() {
        self.title = "Dogos"
        self.navigationController?.navigationBar.isTranslucent = false
        
        self.container.addSubview(self.tableView)
        self.view.addSubview(self.container)
        
        self.container.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
        
        self.tableView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
    }
    
}
