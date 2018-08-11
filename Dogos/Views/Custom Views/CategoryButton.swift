//
//  CategoryButton.swift
//  Dogos
//
//  Created by Nathaniel SISON on 12/8/2018.
//  Copyright © 2018 Nathaniel Brion Sison. All rights reserved.
//

import UIKit



// MARK: ENUMERATIONS
enum CategoryButtonState: Toggleable {
    case normal
    case selected
    
    mutating func toggle() {
        switch self {
        case .normal:
            self = .selected
        case .selected:
            self = .normal
        }
    }
}



// MARK: PROTOCOLS
protocol CategoryButtonDelegate {
    func didChangeState(sender: CategoryButton)
}



class CategoryButton: UIButton {
    
    // MARK: PROPERTIES
    var title = ""
    var code = ""
    
    let normalBackgroundColor = UIColor(red: 51/255, green: 67/255, blue: 81/255, alpha: 1)
    let normalTextColor = UIColor.white
    let normalBorderWidth = CGFloat(0)
    
    let selectedBackgroundColor = UIColor.white
    let selectedTextColor = UIColor.orange
    let selectedBorderWidth = CGFloat(1)
    
    var currentState = CategoryButtonState.normal
    
    
    
    // MARK: OVERRIDES
    init(named name: String, code: String) {
        super.init(frame: .zero)
        self.title = name
        self.code = code
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        
        // Rounded corners
        self.layer.cornerRadius = 15
        self.layer.masksToBounds = true
        self.layer.maskedCorners = [
            CACornerMask.layerMinXMinYCorner,
            CACornerMask.layerMaxXMinYCorner
        ]
        
        self.setBackgroundColor(normalBackgroundColor, for: UIControlState.normal)
        self.setTitleColor(normalTextColor, for: UIControlState.normal)
        self.layer.borderWidth = normalBorderWidth
        
        self.titleLabel?.font = self.titleLabel?.font.withSize(14)
        self.setTitle(self.title, for: UIControlState.normal)
        self.layer.borderColor = UIColor.lightGray.cgColor

    }
    
}



// MARK: EXTENSIONS
extension CategoryButton {
    private func image(withColor color: UIColor) -> UIImage? {
        let rect = CGRect(x: 0.0, y: 0.0, width: 1.0, height: 1.0)
        UIGraphicsBeginImageContext(rect.size)
        let context = UIGraphicsGetCurrentContext()
        
        context?.setFillColor(color.cgColor)
        context?.fill(rect)
        
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return image
    }
    
    func setBackgroundColor(_ color: UIColor, for state: UIControlState) {
        self.setBackgroundImage(image(withColor: color), for: state)
    }
}
