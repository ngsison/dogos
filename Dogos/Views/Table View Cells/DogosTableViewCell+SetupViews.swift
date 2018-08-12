//
//  DogosTableViewCell+SetupViews.swift
//  Dogos
//
//  Created by Nathaniel SISON on 13/8/2018.
//  Copyright © 2018 Nathaniel Brion Sison. All rights reserved.
//

import UIKit
import SnapKit

extension DogosTableViewCell {
    
    internal func setupViews() {
        self.container.addSubview(dogoImage)
        self.addSubview(self.container)
        
        self.dogoImage.snp.makeConstraints { (make) in
            make.edges.equalToSuperview().inset(UIEdgeInsetsMake(0, 0, 10, 0)) // top, left, bottom, right
        }
        
        self.container.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
    }
}
