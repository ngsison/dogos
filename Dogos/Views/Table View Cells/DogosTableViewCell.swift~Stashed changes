//
//  DogosTableViewCell.swift
//  Dogos
//
//  Created by Nathaniel SISON on 9/8/2018.
//  Copyright © 2018 Nathaniel Brion Sison. All rights reserved.
//

import UIKit

class DogosTableViewCell: UITableViewCell {
    
    
    
    // MARK: properties
    public static let identifier = "dogosTableViewCell"
    
    private lazy var container: UIView = {
        let view = UIView()
        
        view.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        
        return view
    }()
    
    private lazy var imageURL: UILabel = {
        let label = UILabel()
        
        return label
    }()
    
    
    
    // MARK: functions
    public func setup(_ url: String) {
        self.imageURL.text = url
    }
    
    
    
    // MARK: overrides
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        self.container.addSubview(imageURL)
        self.addSubview(self.container)

        self.imageURL.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }

        self.container.snp.makeConstraints { (make) in
            make.left.top.right.equalToSuperview()
            make.height.equalTo(50)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
