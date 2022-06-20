//
//  EmployeeCell.swift
//  Learning-MVVM
//
//  Created by 7Peaks on 17/6/2565 BE.
//

import UIKit

class EmployeeCell: UITableViewCell {
    @IBOutlet private var idLabel: UILabel!
    @IBOutlet private var nameLabel: UILabel!
    @IBOutlet private var salaryLabel: UILabel!
    @IBOutlet private var agelabel: UILabel!

    static let identifier: String = "EmployeeCell"

    var cellViewModel: EmployeeCellViewModel? {
        didSet {
            idLabel.text = cellViewModel?.id
            nameLabel.text = cellViewModel?.name
            salaryLabel.text = cellViewModel?.salary
            agelabel.text = cellViewModel?.age
        }
    }

    static func nib() -> UINib {
        return UINib(nibName: identifier, bundle: nil)
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        setup()
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
