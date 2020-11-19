//
//  CustomTabBarController.swift
//  Kyobo_iOS_Develop_WSM
//
//  Created by 이원석 on 2020/11/18.
//

import UIKit

class CustomTabBarVC: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setTabBar()
        // Do any additional setup after loading the view.
    }

    func setTabBar() {
        guard let First = self.storyboard?.instantiateViewController(identifier: "MainHomeVC") as? MainHomeVC
//              let blueVC = self.storyboard?.instantiateViewController(identifier: "BlueVC") as? BlueVC
        else { return
        }
        First.tabBarItem.title = ""
        First.tabBarItem.image = UIImage(named: "homeIc")
        First.tabBarItem.selectedImage = UIImage(named: "offHomeIc")
        
        setViewControllers([First], animated: true)
    }
}


