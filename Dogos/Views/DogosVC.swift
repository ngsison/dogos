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
        view.backgroundColor = .white
        return view
    }()
    
    internal lazy var tableView: UITableView = {
        let tableView = UITableView()
        
        return tableView
    }()
    
    
    
    // MARK: - overrides
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.initViews()
        self.getImages()
    }
    
    
    
    // MARK - network calls
    func getImages() {
        SVProgressHUD.show()
        
        let url = URLHelper.getImagesByBreedURL("husky")
        print(url)
        
        Alamofire.request(url, method: .get).responseJSON { response in
            SVProgressHUD.dismiss()

            switch response.result {
                case .success:
                    print("getImagesByBreed success")
                    
                    if let resultValue = response.result.value {
                        let jsonObj = JSON(resultValue)
                        for (_, item):(String, JSON) in jsonObj {
                            print(item)
                        }
                    }
                
                case .failure:
                    print("An error occured")
            }

        }
    }
}
