//
//  SearchTableViewCell.swift
//  Kyobo_iOS_Develop_WSM
//
//  Created by Seri Park on 2020/12/01.
//

import UIKit

class SearchTableViewCell: UITableViewCell {
    static let identifier = "SearchTableViewCell"

    @IBOutlet var bookimageView: UIImageView!
    @IBOutlet var ebookLabel: UILabel!
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var writerLabel: UILabel!
    @IBOutlet var explainLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        nameLabel.font = UIFont.bold16
        writerLabel.font = UIFont.regular14
        explainLabel.font = UIFont.regular12
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
