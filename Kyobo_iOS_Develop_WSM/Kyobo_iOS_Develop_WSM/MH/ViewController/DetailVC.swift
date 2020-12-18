//
//  DetailVC.swift
//  Kyobo_iOS_Develop_WSM
//
//  Created by 김민희 on 2020/11/14.
//

import UIKit

class DetailVC: UIViewController {

    var detailBook: GenericResponse<SearchData>?
    var ReadingNowModel: ReadingData?
    var NewBooksModel: NewData?
    
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
        setData()
    }

}
extension DetailVC {
    func setView() {
        
        // 뒤로 가기 버튼
        backButton.setImage(UIImage(named: "backIc"), for: .normal)
        backButton.setTitle("", for: .normal)
        backButton.tintColor = UIColor.black
        

        bookLabel.text = "E-Book"
        bookLabel.font = UIFont.systemFont(ofSize: 10)
        bookLabel.textColor = UIColor.dustyOrange

        nameLabel.font = UIFont.bold20

        writerLabel.font = UIFont.regular14
        writerLabel.textColor = UIColor.brownishGrey

        explainLabel.numberOfLines = 0
        explainLabel.font = UIFont.regular12
        explainLabel.textColor = UIColor.brownGrey
    }
    func setData() {
        if let ReadingNowModel = self.ReadingNowModel {
            getRBDetail(index: ReadingNowModel.bookIdx)
        }
        if let NewBooksModel = self.NewBooksModel {
            getNBDetail(index: NewBooksModel.bookIdx)
        }
    }
    func getRBDetail(index: Int) {
        DetailService.shared.getReadingBookDetail(index: index) {
            networkResult in switch
                networkResult {
            
            case .success(let data):
                guard let loadData = data as? GenericResponse<SearchData> else{ return }
                self.detailBook = loadData
                
                let readings = self.detailBook?.data?[0]
                
                self.nameLabel.text = readings?.bookName
                self.writerLabel.text = readings?.bookAuthor
                self.explainLabel.text = readings?.bookInfo
                let image = UIImageView()
                image.setImage(from: readings?.bookImg ?? "imgDetailbook") { image in
                    DispatchQueue.main.async { self.headerImage.image = image }
                }
            case .requestErr:
                print(".requestErr")
            case .pathErr:
                print(".pathErr")
            case .serverErr:
                print(".serverErr")
            case .networkFail:
                print(".networkFail")
            }
        }
    }
    func getNBDetail(index: Int) {
        DetailService.shared.getNewBookDetail(index: index) {
            networkResult in switch
                networkResult {
            
            case .success(let data):
                guard let loadData = data as? GenericResponse<SearchData> else{ return }
                self.detailBook = loadData
                
                let readings = self.detailBook?.data?[0]
                
                self.nameLabel.text = readings?.bookName
                self.writerLabel.text = readings?.bookAuthor
                self.explainLabel.text = readings?.bookInfo
                let image = UIImageView()
                image.setImage(from: readings?.bookImg ?? "imgDetailbook") { image in
                    DispatchQueue.main.async { self.headerImage.image = image }
                }
            case .requestErr:
                print(".requestErr")
            case .pathErr:
                print(".pathErr")
            case .serverErr:
                print(".serverErr")
            case .networkFail:
                print(".networkFail")
            }
        }
    }
}

