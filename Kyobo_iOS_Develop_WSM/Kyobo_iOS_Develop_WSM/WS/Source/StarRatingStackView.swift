//
//  StarRatingStackView.swift
//  Kyobo_iOS_Develop_WSM
//
//  Created by 이원석 on 2020/11/18.
//


import UIKit

class StarRatingStackView: UIStackView {
    
    
    @IBOutlet weak var star1ImageView: UIImageView!
    @IBOutlet weak var star2ImageView: UIImageView!
    @IBOutlet weak var star3ImageView: UIImageView!
    @IBOutlet weak var star4ImageView: UIImageView!
    @IBOutlet weak var star5ImageView: UIImageView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }



}
