//
//  EmployeeCell.swift
//  Learning-MVVM
//
//  Created by 7Peaks on 17/6/2565 BE.
//

import UIKit

class EmployeeCell: UITableViewCell {
    @IBOutlet private weak var idLabel:UILabel!
    @IBOutlet private weak var nameLabel: UILabel!
    @IBOutlet private weak var salaryLabel: UILabel!
    @IBOutlet private weak var agelabel: UILabel!
    
    static let identifier: String = "EmployeeCell"

    static func nib() -> UINib {
        return UINib(nibName: identifier, bundle: nil)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setup() {
        // do some setup view
        selectionStyle = .none
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        idLabel.text = nil
        nameLabel.text = nil
        salaryLabel.text = nil
        agelabel.text = nil
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
