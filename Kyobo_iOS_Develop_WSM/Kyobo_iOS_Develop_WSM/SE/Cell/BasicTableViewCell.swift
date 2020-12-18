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
        bookNameLabel.font = UIFont.bold14
        bookNameLabel.textColor = UIColor.brownGrey
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
