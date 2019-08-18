//
//  ViewController.swift
//  ShopeeSwiftTutorial
//
//  Created by Sihang Huang on 8/18/19.
//  Copyright © 2019 Sihang Huang. All rights reserved.
//

import UIKit

enum TableRow {
    case AmountRow
    case ChannelRow
    
    func title() -> String {
        switch self {
        case .AmountRow:
            return "请输入金额"
        case .ChannelRow:
            return "请选择充值渠道"
        }
    }
}

enum TableSection {
    case AmountSection(rows: [TableRow])
    case ChannelSection(rows: [TableRow])
    
    func title() -> String {
        switch self {
        case .AmountSection:
            return "充值金额"
        case .ChannelSection:
            return "充值渠道"
        }
    }
    
//    func rows() -> [TableRow] {
//        switch self {
//        case .AmountSection(let rows):
//            return rows
//        case .ChannelSection(let rows):
//            return rows
//        }
//    }
}

class ViewController: UIViewController {
    let sections: [TableSection] = [.AmountSection(rows: [.AmountRow]),
                                    .ChannelSection(rows: [.ChannelRow])]
    
    let tableView: UITableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch sections[indexPath.section] {
            
        case .AmountSection(let rows):
            
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "\(AmountTableViewCell.self)", for: indexPath) as? AmountTableViewCell else {
                return UITableViewCell()
            }
            
            cell.textLabel?.text = rows[indexPath.row].title()
            cell.delegate = self;
            
            return cell
        case .ChannelSection(let rows):
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "\(ChannelTableViewCell.self)", for: indexPath) as? ChannelTableViewCell else {
                return UITableViewCell()
            }
            
            cell.textLabel?.text = rows[indexPath.row].title()
            
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        switch sections[section] {
        case .AmountSection(let rows):
            return rows.count
        case .ChannelSection(let rows):
            return rows.count
        }
        
//        return sections[section].rows().count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count;
    }
}

extension ViewController: AmountTableViewCellDelegate {
    func didEnterTopUpAmount(amount: String, cell: AmountTableViewCell) {
        
    }
}

extension ViewController {
    func foo() {
        
    }
}

