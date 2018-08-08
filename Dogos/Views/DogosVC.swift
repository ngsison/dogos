//
//  DogosVC.swift
//  Dogos
//
//  Created by Nathaniel SISON on 8/8/2018.
//  Copyright © 2018 Nathaniel Brion Sison. All rights reserved.
//

import UIKit
import Alamofire
import SVProgressHUD
import SwiftyJSON

class DogosVC: UIViewController {

    // MARK: - properties
    internal lazy var container: UIView = {
        let view = UIView()
        view.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        return view
    }()
    
    // MARK: - overrides
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.initViews()
        self.getImages()
    }
    
    func getImages() {
        SVProgressHUD.show()
        
        let url = URLHelper.getImagesByBreedURL("husky")
        print(url)
        
        Alamofire.request(url, method: .get).responseJSON { response in
            SVProgressHUD.dismiss()
            
            if response.result.isSuccess {
                print("getImagesByBreed success")
                
                if let resultValue = response.result.value {
                    let jsonObj = JSON(resultValue)
                    
                    for (_, item):(String, JSON) in jsonObj {
                        print(item)
                    }
                }
            }
            else if response.result.isFailure {
                print("An error occured")
            }
        }
    }
}
