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
        guard let First = self.storyboard?.instantiateViewController(identifier: "MainHomeVC") as? MainHomeVC,
              let Second = self.storyboard?.instantiateViewController(identifier: "SecVC") as? SecVC,
              let Third = self.storyboard?.instantiateViewController(identifier: "ThirdVC") as? ThirdVC
//              let blueVC = self.storyboard?.instantiateViewController(identifier: "BlueVC") as? BlueVC
        else { return
        }

        First.tabBarItem.title = ""
        First.tabBarItem.image = UIImage(named: "offHomeIc")
        First.tabBarItem.selectedImage = UIImage(named: "homeIc")
        First.tabBarItem.image?.withTintColor(.clear)
        
        Second.tabBarItem.title = ""
        Second.tabBarItem.image = UIImage(named: "offShoppingBasketIc")
        Second.tabBarItem.selectedImage = UIImage(named: "shoppingBasketIc")
        
        Third.tabBarItem.selectedImage = UIImage(named: "shoppingBasketIc")
        Third.tabBarItem.title = ""
        Third.tabBarItem.image = UIImage(named: "offUserIc")
        Third.tabBarItem.selectedImage = UIImage(named: "userIc")
        
        self.tabBar.layer.shadowColor = UIColor.black.cgColor
        self.tabBar.layer.shadowOffset = CGSize(width: 0, height: -4)
        self.tabBar.layer.shadowRadius = 6.0
        self.tabBar.layer.shadowOpacity = 0.05
        self.tabBar.layer.masksToBounds = false // 필수
        
        setViewControllers([First,Second,Third], animated: true)
    }
}


