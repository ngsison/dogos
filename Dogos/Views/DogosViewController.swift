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
    
    
    
    // MARK: PROPERTIES
    private var dogos = [String]()
    private var categoryButtons: [CategoryButton] = [
        CategoryButton(named: "Husky", code: "husky"),
        CategoryButton(named: "Doberman", code: "doberman"),
        CategoryButton(named: "Bully", code: "bulldog"),
        CategoryButton(named: "Pug", code: "pug")
    ]
    private var selectedCategoryIndex = 0
    
    internal lazy var container: UIView = {
        let view = UIView()
        
        view.backgroundColor = UIColor.white
        
        return view
    }()
    
    internal lazy var categoryPickerContainer: UIView = {
        let view = UIView()
        
        view.backgroundColor = UIColor.white
        
        return view
    }()
    
    internal lazy var categoryPickerStackView: UIStackView = {
        let stackView = UIStackView()
        
        stackView.distribution = .fillEqually
        stackView.spacing = 0
        
        for button in categoryButtons {
            button.addTarget(self, action: #selector(onCategoryChanged), for: UIControlEvents.touchUpInside)
            stackView.addArrangedSubview(button)
        }
        
        return stackView
    }()
    
    internal lazy var tableView: UITableView = {
        let tableView = UITableView()
        
        tableView.register(DogosTableViewCell.self, forCellReuseIdentifier: DogosTableViewCell.identifier)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.separatorStyle = UITableViewCellSeparatorStyle.none
        
        // TODO: Fix bug where images in tableview cell doesn't reload if rowHeight is dynamic
        tableView.rowHeight = 350
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
    
    
    
    // MARK: OVERRIDES
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        updateDogos()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        didChangeState(sender: categoryButtons[selectedCategoryIndex])
    }
    
    
    
    // MARK: EVENTS
    @objc func onCategoryChanged(sender: CategoryButton) {
        
        // Revert previously selected button state to Normal
        didChangeState(sender: categoryButtons[selectedCategoryIndex])
        
        // Update the currently selected button index
        selectedCategoryIndex = categoryButtons.index(of: sender)!
        
        // Update new selected button state to Selected
        didChangeState(sender: categoryButtons[selectedCategoryIndex])
        
        // Refresh data
        updateDogos()
    }
    
    
    
    // MARK: NETWORK
    func updateDogos() {
        SVProgressHUD.show()
        
        let breed = categoryButtons[selectedCategoryIndex].code
        let url = URLHelper.getImagesByBreedURL(breed)
        
        print("init getImages - \(url)")
        
        self.dogos.removeAll()
        Alamofire.request(url, method: .get).responseJSON { response in
            SVProgressHUD.dismiss()

            switch response.result {
                case .success:
                    print("getImages success")
                    
                    if let resultValue = response.result.value {
                        let jsonObj = JSON(resultValue)
                        
                        let status = jsonObj["status"]
                        let message = jsonObj["message"]
                        
                        if status == "success" {
                            for (_, item):(String, JSON) in message {
                                self.dogos.append(item.stringValue)
                            }
                            
                            print("number of dogos: \(self.dogos.count)")
                            self.tableView.reloadData()
                        }
                    }
                
                case .failure:
                    print("getImages failed")
            }

        }
    }
}



// MARK: EXTENSION - CategoryButtonDelegate
extension DogosViewController: CategoryButtonDelegate {
    
    func didChangeState(sender: CategoryButton) {
        sender.currentState.toggle()
        
        switch sender.currentState {
        case .normal:
            sender.setBackgroundColor(sender.normalBackgroundColor, for: UIControlState.normal)
            sender.setTitleColor(sender.normalTextColor, for: UIControlState.normal)
            sender.layer.borderWidth = sender.normalBorderWidth
        case .selected:
            sender.setBackgroundColor(sender.selectedBackgroundColor, for: UIControlState.normal)
            sender.setTitleColor(sender.selectedTextColor, for: UIControlState.normal)
            sender.layer.borderWidth = sender.selectedBorderWidth
        }
        
        print("current selected category: \(categoryButtons[selectedCategoryIndex].title)")
    }
    
}



// MARK: EXTENSION - UITableViewDataSource
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



// MARK: EXTENSION - UITableViewDelegate
extension DogosViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
}
