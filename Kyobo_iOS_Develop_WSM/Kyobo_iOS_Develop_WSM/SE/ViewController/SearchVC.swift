//
//  SearchVC.swift
//  Kyobo_iOS_Develop_WSM
//
//  Created by 김민희 on 2020/11/14.
//

import UIKit

class SearchVC: UIViewController {

    @IBOutlet var serahTableView: UITableView!
    @IBOutlet var searchTextField: UITextField!
    
    var bookSearch: [Book] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setBookData()
        searchTextField.layer.cornerRadius = 8
        searchTextField.backgroundColor = .veryLightPink

        // Do any additional setup after loading the view.
    }
    
    func setBookData() {
        bookSearch.append(contentsOf: [
            Book
        ])
    }
  

}
