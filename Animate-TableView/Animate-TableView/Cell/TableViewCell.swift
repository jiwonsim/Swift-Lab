//
//  TableViewCell.swift
//  Animate-TableView
//
//  Created by 심지원 on 2020/08/19.
//  Copyright © 2020 심지원. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var toDoLabel: UILabel!
    @IBOutlet weak var motivLabel: UILabel!
    
    func populate(_ toDo: String, _ motiv: String?, _ checked: Bool) {
        toDoLabel.text = toDo
        motivLabel.text = motiv
        if checked {
            self.contentView.alpha = 0.6
        }
        else { self.contentView.alpha = 1.0 }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}

extension UITableViewCell {
    static var identifier: String {
        return String(describing: self)
    }
}
