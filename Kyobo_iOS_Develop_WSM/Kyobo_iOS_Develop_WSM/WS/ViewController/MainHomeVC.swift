//
//  MainHomeVC.swift
//  Kyobo_iOS_Develop_WSM
//
//  Created by 김민희선생님 on 2020/11/14.
//

import UIKit

class MainHomeVC: UIViewController {
    
    //MARK: - 데이타 구조체
    var ReadingNowModel: GenericResponse<ReadingData>?
    var NewBooksModel: GenericResponse<NewData>?
    
    //MARK: - Outlets
    @IBOutlet weak var topHeaderView: UIView!
    @IBOutlet weak var bottomShadowView: UIView!
    @IBOutlet weak var readingNowCollectionView: UICollectionView!
    @IBOutlet weak var newBooksCollectionView: UICollectionView!
    @IBOutlet weak var readingNowLabel: UILabel!
    @IBOutlet weak var readingNowBtn: UIButton!
    @IBOutlet weak var newBooksLabel: UILabel!
    @IBOutlet weak var newBooksBtn: UIButton!
    
    //MARK: - 기타 선언부
    private var shadowLayer: CAShapeLayer!
    
    @IBAction func findButtonDidTap(_ sender: Any) {
        let seStoryboard = UIStoryboard(name: "SearchTab", bundle: nil)
        let dvc = seStoryboard.instantiateViewController(identifier: "SearchVC")
        self.navigationController?.pushViewController(dvc, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewStyle()
        getReading()
        getNewing()
        
        readingNowCollectionView.register(ReadingNowCell.nib(), forCellWithReuseIdentifier: ReadingNowCell.identifier)
        readingNowCollectionView.delegate = self
        readingNowCollectionView.dataSource = self
        readingNowCollectionView.backgroundColor = .darkWhite
        
        newBooksCollectionView.register(NewBooksCell.nib(), forCellWithReuseIdentifier: NewBooksCell.identifier)
        newBooksCollectionView.delegate = self
        newBooksCollectionView.dataSource = self
        newBooksCollectionView.backgroundColor = .darkWhite
    }
    
    
    //MARK: - Custom Style func
    func viewStyle() {
        self.view.backgroundColor = .darkWhite
        
        readingNowLabel.textColor = .dark
        readingNowLabel.font = UIFont.bold18
        newBooksLabel.textColor = .dark
        newBooksLabel.font = UIFont.bold18
        readingNowBtn.tintColor = .brownGrey
        readingNowBtn.titleLabel?.font = UIFont.regular12
        newBooksBtn.tintColor = .brownGrey
        readingNowBtn.titleLabel?.font = UIFont.regular12
        
        bottomShadowView.layer.shadowColor = UIColor.black.cgColor
        bottomShadowView.layer.shadowOffset = CGSize(width: 0, height: -4)
        bottomShadowView.layer.shadowRadius = 6.0
        bottomShadowView.layer.shadowOpacity = 0.05
        bottomShadowView.layer.masksToBounds = false //<-
        
        topHeaderView.layer.shadowColor = UIColor.black.cgColor
        topHeaderView.layer.shadowOffset = CGSize(width: 0, height: 4)
        topHeaderView.layer.shadowRadius = 4.0
        topHeaderView.layer.shadowOpacity = 0.07
        topHeaderView.layer.masksToBounds = false // 필수
    }
}

extension MainHomeVC: UICollectionViewDelegate{
    
}

//MARK: - DataSource
extension MainHomeVC: UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == self.readingNowCollectionView {
            return ReadingNowModel?.data?.count ?? 0
        }else if collectionView == self.newBooksCollectionView {
            return NewBooksModel?.data?.count ?? 0
        }else{
            return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if collectionView == self.readingNowCollectionView {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ReadingNowCell.identifier, for: indexPath) as? ReadingNowCell
            else{
                return UICollectionViewCell()
            }
            
            let readings = ReadingNowModel?.data?[indexPath.row]
            cell.bookNameLabel?.text = readings?.bookName
            cell.bookCategoryLabel?.text = readings?.bookKind
            cell.bookWriterLabel?.text = readings?.bookAuthor
            
            let image = UIImageView()
            image.setImage(from: readings?.bookImg ?? "bookImg1") { image in
                DispatchQueue.main.async { cell.bookImageview.image = image }
            }
            // Configure the cell shadow
            cell.layer.shadowColor = UIColor.black.cgColor
            cell.layer.shadowOffset = CGSize(width: 0, height: 4)
            cell.layer.shadowRadius = 4.0
            cell.layer.shadowOpacity = 0.1
            cell.layer.masksToBounds = false // 필수
            return cell
            
        }else if collectionView == self.newBooksCollectionView {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: NewBooksCell.identifier, for: indexPath) as? NewBooksCell
            else{
                return UICollectionViewCell()
            }
            
            let newings = NewBooksModel?.data?[indexPath.row]
            let image = UIImageView()
            image.setImage(from: newings?.bookImg ?? "bookImg1") { image in
                DispatchQueue.main.async { cell.newBookImageView.image = image }
            }
            return cell
            
        }else{
            return UICollectionViewCell()
        }
    }
    
    
}

//MARK: - Delegate
extension MainHomeVC: UICollectionViewDelegateFlowLayout{
    
    //MARK: - Cell 사이즈
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize
    {
        if collectionView == self.readingNowCollectionView{
            return CGSize(width: (collectionView.frame.width)*0.79, height: (collectionView.frame.height)*0.84)
        }else if collectionView == self.newBooksCollectionView{
            return CGSize(width: 108, height: 157)
        }else{
            return CGSize(width: 0, height: 0)
        }
    }
    
    //MARK: - Cell간의 좌우간격 지정
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat
    {
        if collectionView == self.readingNowCollectionView{
            return 14
        }else if collectionView == self.newBooksCollectionView{
            return 6
        }else{
            return 0
        }
    }
    
    //MARK: - 마진
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets
    {
        
        if collectionView == self.readingNowCollectionView{
            return UIEdgeInsets(top: (collectionView.frame.height-149)/2, left: 24, bottom: (collectionView.frame.height-149)/2, right: 0)
        }else if collectionView == self.newBooksCollectionView{
            return UIEdgeInsets(top: 15, left: 24, bottom: 9, right: 0)
        }else{
            return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        }
        
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let mhStoryboard = UIStoryboard(name: "DetailTab", bundle: nil)
        let dvc = mhStoryboard.instantiateViewController(identifier: "DetailVC")
        self.navigationController?.pushViewController(dvc, animated: true)
    }
    
}


extension MainHomeVC {
    func getReading() {
        ReadingService.shared.reading() { (networkResult) -> (Void) in
            switch networkResult{
            
            case .success(let data):
                guard let loadData = data as? GenericResponse<ReadingData> else{ return }
                
                self.ReadingNowModel = loadData
                self.readingNowCollectionView.reloadData()
                
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
    
    func getNewing() {
        ReadingService.shared.newing() { (networkResult) -> (Void) in
            switch networkResult{
            
            case .success(let data):
                guard let loadData = data as? GenericResponse<NewData> else{ return }
                
                self.NewBooksModel = loadData
                self.newBooksCollectionView.reloadData()
                
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

