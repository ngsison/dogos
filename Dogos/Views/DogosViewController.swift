//
//  DogosViewController.swift
//  Dogos
//
//  Created by Nathaniel SISON on 8/8/2018.
//  Copyright © 2018 Nathaniel Brion Sison. All rights reserved.
//

import UIKit
import Alamofire
import SVProgressHUD
import SwiftyJSON

class DogosViewController: UIViewController {
    
    
    
    // MARK: properties
    
    private var dogos = [String]()
    
    internal lazy var container: UIView = {
        let view = UIView()
        
        view.backgroundColor = UIColor.white
        
        return view
    }()
    
    internal lazy var categoryPickerContainer: UIView = {
        let view = UIView()
        
        view.backgroundColor = UIColor.lightGray
        
        return view
    }()
    
    internal lazy var categoryPickerStackView: UIStackView = {
        let stackView = UIStackView()
        
        stackView.distribution = .fillEqually
        
        let categoryButton1 = UIButton()
        let categoryButton2 = UIButton()
        let categoryButton3 = UIButton()
        let categoryButton4 = UIButton()
        
        categoryButton1.setTitle("Husky", for: UIControlState.normal)
        categoryButton2.setTitle("Doberman", for: UIControlState.normal)
        categoryButton3.setTitle("Bully", for: UIControlState.normal)
        categoryButton4.setTitle("Pug", for: UIControlState.normal)
        
        stackView.addArrangedSubview(categoryButton1)
        stackView.addArrangedSubview(categoryButton2)
        stackView.addArrangedSubview(categoryButton3)
        stackView.addArrangedSubview(categoryButton4)
        
        return stackView
    }()
    
    internal lazy var tableView: UITableView = {
        let tableView = UITableView()
        
        tableView.register(DogosTableViewCell.self, forCellReuseIdentifier: DogosTableViewCell.identifier)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.separatorStyle = UITableViewCellSeparatorStyle.none
        
        // TODO: Fix bug where images in tableview cell doesn't reload if rowHeight is dynamic
        tableView.rowHeight = 300
        //tableView.rowHeight = UITableViewAutomaticDimension
        
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



// MARK: Extension - UITableViewDataSource

extension DogosViewController: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dogos.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: DogosTableViewCell.identifier, for: indexPath) as! DogosTableViewCell

        cell.setup(self.dogos[indexPath.row])

        return cell
    }

}



// MARK: Extension - UITableViewDelegate

extension DogosViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
}
