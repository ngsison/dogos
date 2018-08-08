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
        print("Views will be initialized.")

        title = "Dogos"
        navigationController?.navigationBar.isTranslucent = false
        
        container.addSubview(box)
        view.addSubview(container)
        
        container.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
        
        box.snp.makeConstraints { (make) in
            make.size.equalTo(100)
            make.center.equalToSuperview()
        }
    }
    
}
