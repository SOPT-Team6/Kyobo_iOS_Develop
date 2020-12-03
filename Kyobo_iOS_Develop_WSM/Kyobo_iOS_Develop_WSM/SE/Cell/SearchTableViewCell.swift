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
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    
    func setCell (book : Book) {
        bookimageView.image = book.makeBookImage()
        ebookLabel.text = book.ebook
        nameLabel.text = book.name
        writerLabel.text = book.writer
        explainLabel.text = book.explain
    }

}
