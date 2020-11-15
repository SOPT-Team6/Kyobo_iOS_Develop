//
//  ViewController.swift
//  Kyobo_iOS_Develop_WSM
//
//  Created by 김민희 on 2020/11/14.
//

import UIKit

class ViewController: UIViewController {

    
    @IBAction func wsButtonDidTap(_ sender: Any) {
        let sb = UIStoryboard(name: "MainTab", bundle: nil)
        guard let nextVC = sb.instantiateViewController(withIdentifier: "MainHomeVC") as? MainHomeVC else {
            return
        }
        nextVC.modalPresentationStyle = .fullScreen
        present(nextVC, animated: true, completion: nil)
    }
    
    @IBAction func seButtonDidTap(_ sender: Any) {
        let sb = UIStoryboard(name: "SearchTab", bundle: nil)
        guard let nextVC = sb.instantiateViewController(withIdentifier: "SearchVC") as? SearchVC else {
            return
        }
        nextVC.modalPresentationStyle = .fullScreen
        present(nextVC, animated: true, completion: nil)
    }
    
    @IBAction func mhButtonDidTap(_ sender: Any) {
        let sb = UIStoryboard(name: "DetailTab", bundle: nil)
        guard let nextVC = sb.instantiateViewController(withIdentifier: "DetailVC") as? DetailVC else {
            return
        }
        nextVC.modalPresentationStyle = .fullScreen
        present(nextVC, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

