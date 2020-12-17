//
//  SearchVC.swift
//  Kyobo_iOS_Develop_WSM
//
//  Created by 김민희 on 2020/11/14.
//

import UIKit

class SearchVC: UIViewController, UITextFieldDelegate {
    
    var PopularModel: GenericResponse<PopularData>?
    var SearchModel: GenericResponse<SearchData>?
    
    var isSearch : Bool = false
    
    @IBOutlet var searchTableView: UITableView!
    @IBOutlet var searchTextField: UITextField!
    
    @IBAction func backButtonDidTap(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        getPopular()
        
        searchTableView.dataSource = self
        searchTableView.delegate = self
        searchTableView.separatorStyle = UITableViewCell.SeparatorStyle.none
        
        
        searchTextField.delegate = self
        searchTextField.layer.cornerRadius = 8
        searchTextField.backgroundColor = .veryLightPink
        searchTextField.placeholder = "보고싶은 책을 검색해주세요 :)"
        searchTextField.addLeftPadding()
    }
    

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.searchTextField.resignFirstResponder()
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        getSearch(searchKeyword: searchTextField.text ?? "")
        searchTextField.endEditing(true)
        isSearch = true
        searchTableView.reloadData()
        return true
    }
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
}


extension SearchVC: UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if isSearch == false {
            return PopularModel?.data?.count ?? 0
        } else {
            return SearchModel?.data?.count ?? 0
        }
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if isSearch == true {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: SearchTableViewCell.identifier) as?
                    SearchTableViewCell else {
                return UITableViewCell()
            }
            
            let search = SearchModel?.data?[indexPath.row]
            cell.ebookLabel?.text = search?.bookKind
            cell.nameLabel?.text = search?.bookName
            cell.writerLabel?.text = search?.bookAuthor
            cell.explainLabel?.text = search?.bookInfo
            
            
            let image = UIImageView()
            image.setImage(from: search?.bookImg ?? "bookImg1") { image in
                DispatchQueue.main.async { cell.bookimageView.image = image }
            }
            return cell
            
            
        } else {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: BasicTableViewCell.identifier) as?
                    BasicTableViewCell else {
                return UITableViewCell()
            }
           
            let popular = PopularModel?.data?[indexPath.row]
            cell.bookNameLabel?.text = popular?.searchKeyword
            
            return cell
            
        }
    }
}

extension SearchVC : UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if isSearch == false {
            return 36/667 * self.view.frame.height
        } else {
            return 200/667 * self.view.frame.height
        }
    }
}

extension UITextField{
    func addLeftPadding() {
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 12, height: self.frame.height))
        self.leftView = paddingView
        self.leftViewMode = ViewMode.always
    }
}



extension SearchVC {
    func getPopular() {
        SearchService.shared.popular() { (networkResult) -> (Void) in
            switch networkResult{
            
            case .success(let data):
                guard let loadData = data as? GenericResponse<PopularData> else{ return }
                
                self.PopularModel = loadData
                self.searchTableView.reloadData()
                
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
    

    func getSearch(searchKeyword : String) {
        SearchService.shared.search(keyword : searchKeyword) {
            (networkResult) -> (Void) in
                switch networkResult{
                
                case .success(let data):
                    print(data)
                    guard let loadData = data as? GenericResponse<SearchData> else{ return }
                    
                    self.SearchModel = loadData
                    self.searchTableView.reloadData()
                    
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
