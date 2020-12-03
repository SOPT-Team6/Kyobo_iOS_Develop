//
//  SearchVC.swift
//  Kyobo_iOS_Develop_WSM
//
//  Created by 김민희 on 2020/11/14.
//

import UIKit

class SearchVC: UIViewController, UITextFieldDelegate {
    
    @IBOutlet var searchTableView: UITableView!
    @IBOutlet var searchTextField: UITextField!
    
    @IBAction func backButtonDidTap(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }

    var bookSearch: [Book] = []
    var basicData: [Basic] = []
    var isSearch : Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setBookData()
        setBasicData()
        
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
        searchTextField.endEditing(true)
        isSearch = true
        searchTableView.reloadData()
        return true
    }
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func setBasicData() {
        basicData.append(contentsOf: [
            Basic(bookName: "김민희최고"),
            Basic(bookName: "이다은최고"),
            Basic(bookName: "아요최고"),
            Basic(bookName: "책읽기싫어"),
            Basic(bookName: "너무어렵다"),
        ])
        
    }
    
    func setBookData() {
        bookSearch.append(contentsOf: [
            Book(name: "백설공주에게 죽음을", writer: "넬레노이 하우스 저", BookImageName: "book5Img", explain: "‘백설공주에게 죽음을’은 넬레노이 하우스의 베스트셀러 작품으로써 많은 사람들에게 큰 사랑을 받고 있다.(총46자)", ebook: "E-Book"),
            Book(name: "여우가 잠든 숲 2", writer: "넬레노이 하우스 저", BookImageName: "book6Img", explain: "넬레노이 하우스만의 새로운 대표작인여우가 잠든 숲2, 새하얀 안개가 피우던 날 갑자기 사라진 소년과 소녀는 어디로...(총46자)", ebook: "E-Book")
        ])
    }
}

extension SearchVC : UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if isSearch == false {
            return 36/667 * self.view.frame.height
        } else {
            return 193/667 * self.view.frame.height
        }
    }
}

extension SearchVC: UITableViewDataSource{
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if isSearch == false {
            return basicData.count
        } else {
            return bookSearch.count
        }
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if isSearch == true {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: SearchTableViewCell.identifier) as?
                    SearchTableViewCell else {
                return UITableViewCell()
            }
            cell.setCell(book: bookSearch[indexPath.row])
            return cell
            
        } else {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: BasicTableViewCell.identifier) as?
                    BasicTableViewCell else {
                return UITableViewCell()
            }
            cell.setCell(basic: basicData[indexPath.row])
            return cell
            
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

