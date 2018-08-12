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
    

    
    // MARK: PROPERTIES
    public static let identifier = "dogosTableViewCell"
    
    internal lazy var container: UIView = {
        let view = UIView()
        return view
    }()
    
    internal lazy var dogoImage: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = UIViewContentMode.scaleAspectFill
        imageView.clipsToBounds = true
        return imageView
    }()
    
    
    
    // MARK: FUNCTIONS
    public func setup(_ urlString: String) {
        if let url = URL(string: urlString) {
            self.dogoImage.kf.setImage(with: url, placeholder: nil, options: [.transition(.fade(0.5))], progressBlock: nil, completionHandler: nil)
        }
    }
    
    
    
    // MARK: OVERRIDES
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
