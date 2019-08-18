//
//  ViewController.swift
//  ShopeeSwiftTutorial
//
//  Created by Sihang Huang on 8/18/19.
//  Copyright © 2019 Sihang Huang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let tableView: UITableView
    
    init() {
        tableView = UITableView();
        
        super.init(nibName: nil, bundle: nil)
        
        tableView.dataSource = self;
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
}

