//
//  BasicTableViewCell.swift
//  Kyobo_iOS_Develop_WSM
//
//  Created by Seri Park on 2020/12/03.
//

import UIKit

class BasicTableViewCell: UITableViewCell {
    static let identifier = "BasicTableViewCell"
    
    @IBOutlet var bookNameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func setCell(basic: Basic) {
        bookNameLabel.text = basic.bookName
    }

}
