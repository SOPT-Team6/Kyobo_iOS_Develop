//
//  NewBooksCell.swift
//  Kyobo_iOS_Develop_WSM
//
//  Created by 이원석 on 2020/11/17.
//

import UIKit

class NewBooksCell: UICollectionViewCell {
    static let identifier = "NewBooksCell"
    
    @IBOutlet weak var newBookImageView: UIImageView!
    
    func setnewBookData(newBookName: String){
        self.newBookImageView.image = UIImage(named: newBookName)
    }
    
    static func nib() -> UINib {
        return UINib(nibName: "NewBooksCell", bundle: nil)
    }
    override func awakeFromNib() {
        super.awakeFromNib()
    }
}
