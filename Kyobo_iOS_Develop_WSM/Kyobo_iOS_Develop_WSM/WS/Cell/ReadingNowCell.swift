//
//  ReadingNowCell.swift
//  Kyobo_iOS_Develop_WSM
//
//  Created by 이원석 on 2020/11/17.
//

import UIKit

class ReadingNowCell: UICollectionViewCell {
    static let identifier = "ReadingNowCell"
    
    @IBOutlet weak var bookImageview: UIImageView!
    @IBOutlet weak var bookNameLabel: UILabel!
    @IBOutlet weak var bookWriterLabel: UILabel!
    
    func setReadingNowData(imageName: String, bookName: String, writerName: String) {
        self.bookImageview.image = UIImage(named: imageName)
        self.bookNameLabel.text = bookName
        self.bookWriterLabel.text = writerName
    }
    
    static func nib() -> UINib {
        return UINib(nibName: "ReadingNowCell", bundle: nil)
    }
    override func awakeFromNib() {
        super.awakeFromNib()
    }
}
