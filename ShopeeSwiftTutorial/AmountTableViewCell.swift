//
//  AmountTableViewCell.swift
//  ShopeeSwiftTutorial
//
//  Created by Sihang Huang on 8/18/19.
//  Copyright © 2019 Sihang Huang. All rights reserved.
//

import UIKit

protocol AmountTableViewCellDelegate: class {
    func didEnterTopUpAmount(amount: String, cell: AmountTableViewCell)
}

class AmountTableViewCell: UITableViewCell {

    weak var delegate: AmountTableViewCellDelegate?
    
    lazy var textField: UITextField = {
       let textField = UITextField()
        textField.delegate = self
        return textField
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.contentView.addSubview(textField)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

extension AmountTableViewCell: UITextFieldDelegate {
    func textFieldDidEndEditing(_ textField: UITextField) {
        
        guard let text = textField.text, !text.isEmpty else {
            return
        }
        
        delegate?.didEnterTopUpAmount(amount: text, cell: self)
    }
}
