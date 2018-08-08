//
//  DogosVC.swift
//  Dogos
//
//  Created by Nathaniel SISON on 8/8/2018.
//  Copyright © 2018 Nathaniel Brion Sison. All rights reserved.
//

import UIKit

class DogosVC: UIViewController {

    // MARK: - properties
    internal lazy var container: UIView = {
        let view = UIView()
        view.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        return view
    }()
    
    internal lazy var box: UIView = {
        let view = UIView()
        view.backgroundColor = #colorLiteral(red: 0.2588235438, green: 0.7568627596, blue: 0.9686274529, alpha: 1)
        return view
    }()
    
    // MARK: - overrides
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("DogosVC has been loaded!")
        
        self.initViews()
    }
}
