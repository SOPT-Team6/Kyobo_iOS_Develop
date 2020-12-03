//
//  DetailVC.swift
//  Kyobo_iOS_Develop_WSM
//
//  Created by 김민희 on 2020/11/14.
//

import UIKit

class DetailVC: UIViewController {

    @IBOutlet weak var headerImage: UIImageView!
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var bookLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var writerLabel: UILabel!
    @IBOutlet weak var explainLabel: UILabel!
    
    
    @IBAction func backButtonDidTap(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setView()
    }

}
extension DetailVC {
    func setView() {
        
        // 뒤로 가기 버튼
        backButton.setImage(UIImage(named: "backIc"), for: .normal)
        backButton.setTitle("", for: .normal)
        backButton.tintColor = UIColor.black
        
        headerImage.image = UIImage(named: "imgDetailbook")
        
        bookLabel.text = "E-Book"
        bookLabel.font = UIFont.systemFont(ofSize: 10)
        bookLabel.textColor = UIColor.dustyOrange
        
        nameLabel.text = "여우가 잠든 숲"
        nameLabel.font = UIFont.bold20
        
        
        writerLabel.text = "넬레 노이하우스"
        writerLabel.font = UIFont.regular14
        writerLabel.textColor = UIColor.brownishGrey
        
        explainLabel.numberOfLines = 0
        explainLabel.font = UIFont.regular12
        explainLabel.textColor = UIColor.brownGrey
        explainLabel.text = "30여 개국 번역 출간, 600만 부 판매, 독일 베스트 1위\n전 세계를 매혹시킨 미스터리의 여왕 넬레 노이하우스\n시한부 선고를 극복하고 발표한 타우누스 시리즈 2년 만의 최신 대표작\n\n전 세계 30여 개국 출간, 600만 부 이상 판매\n슈피겔 베스트셀러 1위, 독일 아마존 베스트셀러 1위\n\n조용한 마을을 뒤흔든 의문의 연쇄 살인"
    }
}
