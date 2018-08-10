//
//  DogosTableViewCell.swift
//  Dogos
//
//  Created by Nathaniel SISON on 9/8/2018.
//  Copyright © 2018 Nathaniel Brion Sison. All rights reserved.
//

import UIKit
import Kingfisher

class DogosTableViewCell: UITableViewCell {
    

    
    // MARK: properties
    
    public static let identifier = "dogosTableViewCell"
    
    private lazy var container: UIView = {
        let view = UIView()
        return view
    }()
    
    private lazy var dogoImage: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = UIViewContentMode.scaleAspectFill
        imageView.clipsToBounds = true
        return imageView
    }()
    
    
    
    // MARK: functions
    
    public func setup(_ urlString: String) {
        if let url = URL(string: urlString) {
            self.dogoImage.kf.setImage(with: url, placeholder: nil, options: [.transition(.fade(0.5))], progressBlock: nil, completionHandler: nil)
        }
    }
    
    
    
    // MARK: overrides
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        self.container.addSubview(dogoImage)
        self.addSubview(self.container)

        self.dogoImage.snp.makeConstraints { (make) in
            make.edges.equalToSuperview().inset(UIEdgeInsetsMake(0, 0, 10, 0)) // top, left, bottom, right
        }

        self.container.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
