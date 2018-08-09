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

class DogosVC: UIViewController, UITableViewDataSource, UITableViewDelegate {

    
    
    // MARK: properties
    private var dogos = [String]()
    
    internal lazy var container: UIView = {
        let view = UIView()
        
        view.backgroundColor = .white
        
        return view
    }()
    
    internal lazy var tableView: UITableView = {
        let tableView = UITableView()
        
        tableView.register(DogosTableViewCell.self, forCellReuseIdentifier: DogosTableViewCell.identifier)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.separatorStyle = UITableViewCellSeparatorStyle.none
        
        return tableView
    }()
    
    private lazy var dogosTableViewCell: DogosTableViewCell = {
        let cell = DogosTableViewCell(
            style: UITableViewCellStyle.default,
            reuseIdentifier: DogosTableViewCell.identifier
        )
        
        return cell
    }()
    
    
    
    // MARK: overrides
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setupViews()
        self.getImages()
    }
    
    
    
    // MARK: table view
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dogos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: DogosTableViewCell.identifier, for: indexPath) as! DogosTableViewCell
        
        cell.setup(self.dogos[indexPath.row])
        
        return cell
    }
    
    
    
    // MARK: network calls
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
                        
                        let status = jsonObj["status"]
                        let message = jsonObj["message"]
                        
                        if status == "success" {
                            for (_, item):(String, JSON) in message {
                                self.dogos.append(item.stringValue)
                            }
                            self.tableView.reloadData()
                        }
                    }
                
                case .failure:
                    print("An error occured")
            }

        }
    }
}
