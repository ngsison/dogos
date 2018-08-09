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
        do {
            let url = URL(string: urlString)
            
            if let url = url {
                let imageData = try Data(contentsOf: url)
                self.dogoImage.image = UIImage(data: imageData)
            }
        }
        catch {
            print("Loading Image Failed")
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
