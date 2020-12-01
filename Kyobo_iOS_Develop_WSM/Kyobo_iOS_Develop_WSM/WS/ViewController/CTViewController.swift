//
//  CTViewController.swift
//  Kyobo_iOS_Develop_WSM
//
//  Created by 이원석 on 2020/11/19.
//

import UIKit

class CTViewController: UIViewController, UIPageViewControllerDataSource, UIPageViewControllerDelegate, UIScrollViewDelegate {
    static let identifier = "CTViewController"
    
    //MARK: - Outlets
    @IBOutlet weak var tabBarView: UIView!
    
    @IBOutlet weak var FirstBtn: UIButton!
    @IBOutlet weak var SecBtn: UIButton!
    @IBOutlet weak var ThirdBtn: UIButton!
    
    @IBOutlet weak var viewLine: UIView!
    @IBOutlet weak var constantViewLeft: NSLayoutConstraint!
    
    //MARK: - TabBar Views
    var tab1VC: MainHomeVC! = nil
    var tab2VC: SecVC! = nil
    var tab3VC: ThirdVC! = nil
    
    private var pageController: UIPageViewController!
    private var arrVC:[UIViewController] = []
    private var currentPage: Int!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        currentPage = 0
        createPageViewController()
        viewLine.backgroundColor = .grass
        self.FirstBtn.setImage(UIImage(named: "homeIc"), for: UIControl.State.normal)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // MARK: - Shadow
    func tabBarShadowStyle(){
        tabBarView.layer.shadowColor = UIColor.black.cgColor
        tabBarView.layer.shadowOffset = CGSize(width: 0, height: -4)
        tabBarView.layer.shadowRadius = 6.0
        tabBarView.layer.shadowOpacity = 0.05
        tabBarView.layer.masksToBounds = false
    }
    
    
    //MARK: - Custom Methods
    private func selectedButton(btn: UIButton) {
        
        btn.setTitleColor(UIColor.black, for: .normal)
        
        constantViewLeft.constant = btn.frame.origin.x
        
        UIView.animate(withDuration: 0.3) {
            self.view.layoutIfNeeded()
        }
        
    }
    
    //MARK: - IBaction Methods
    @IBAction private func btnOptionClicked(btn: UIButton) {
        
        if btn == self.FirstBtn{
            btn.tag = 1
        }else if btn == self.SecBtn{
            btn.tag = 2
        }else if btn == self.ThirdBtn{
            btn.tag = 3
        }

        
        pageController.setViewControllers([arrVC[btn.tag-1]], direction: UIPageViewController.NavigationDirection.reverse, animated: false, completion: {(Bool) -> Void in
        })

        if btn == self.FirstBtn{
            btn.setImage(UIImage(named: "homeIc"), for: UIControl.State.normal)
            self.SecBtn.setImage(UIImage(named: "offShoppingBasketIc"), for: UIControl.State.normal)
            self.ThirdBtn.setImage(UIImage(named: "offUserIc"), for: UIControl.State.normal)
        }else if btn == self.SecBtn{
            btn.setImage(UIImage(named: "shoppingBasketIc"), for: UIControl.State.normal)
            self.FirstBtn.setImage(UIImage(named: "offHomeIc"), for: UIControl.State.normal)
            self.ThirdBtn.setImage(UIImage(named: "offUserIc"), for: UIControl.State.normal)
        }else if btn == self.ThirdBtn{
            btn.setImage(UIImage(named: "userIc"), for: UIControl.State.normal)
            self.SecBtn.setImage(UIImage(named: "offShoppingBasketIc"), for: UIControl.State.normal)
            self.FirstBtn.setImage(UIImage(named: "offHomeIc"), for: UIControl.State.normal)

        }
        
        resetTabBarForTag(tag: btn.tag-1)
    }
    
    //MARK: - CreatePagination
    private func createPageViewController() {
        
        pageController = UIPageViewController.init(transitionStyle: UIPageViewController.TransitionStyle.scroll, navigationOrientation: UIPageViewController.NavigationOrientation.horizontal, options: nil)
        
        pageController.view.backgroundColor = UIColor.clear
        pageController.delegate = self
        pageController.dataSource = self
        
        for svScroll in pageController.view.subviews as! [UIScrollView] {
            svScroll.delegate = self
        }

        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
            self.pageController.view.frame = CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: self.view.frame.size.height-64)
        }
        
        let homeStoryboard = UIStoryboard(name: "MainTab", bundle: nil)
        tab1VC = homeStoryboard.instantiateViewController(withIdentifier: "MainHomeVC") as? MainHomeVC
        tab2VC = homeStoryboard.instantiateViewController(withIdentifier: "SecVC") as? SecVC
        tab3VC = homeStoryboard.instantiateViewController(withIdentifier: "ThirdVC") as? ThirdVC
        
        
        arrVC = [tab1VC, tab2VC, tab3VC]
        
        pageController.setViewControllers([tab1VC], direction: UIPageViewController.NavigationDirection.forward, animated: false, completion: nil)
        
        self.addChild(pageController)
        self.view.addSubview(pageController.view)
        pageController.didMove(toParent: self)
    }
    
    
    private func indexofviewController(viewCOntroller: UIViewController) -> Int {
        if(arrVC .contains(viewCOntroller)) {
            return arrVC.firstIndex(of: viewCOntroller)!
        }
        
        return -1
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        
        var index = indexofviewController(viewCOntroller: viewController)
        
        if(index != -1) {
            index = index - 1
        }
        
        if(index < 0) {
            return nil
        }
        else {
            return arrVC[index]
        }
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        
        var index = indexofviewController(viewCOntroller: viewController)
        
        if(index != -1) {
            index = index + 1
        }
        
        if(index >= arrVC.count) {
            return nil
        }
        else {
            return arrVC[index]
        }
    }
    
    func pageViewController(_ pageViewController1: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        
        if(completed) {
            currentPage = arrVC.firstIndex(of: (pageViewController1.viewControllers?.last)!)
            resetTabBarForTag(tag: currentPage)
        }
    }
    
    //MARK: - Set TabBar after selecting Option from Top Tabbar
    private func resetTabBarForTag(tag: Int) {
        
        var sender: UIButton!
        
        if(tag == 0) {
            sender = FirstBtn
        }
        else if(tag == 1) {
            sender = SecBtn
        }
        else if(tag == 2) {
            sender = ThirdBtn
        }
        
        currentPage = tag
        selectedButton(btn: sender)
        
    }
    
    //MARK: - UIScrollView Delegate Methods
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        let xFromCenter: CGFloat = self.view.frame.size.width-scrollView.contentOffset.x
        let xCoor: CGFloat = CGFloat(viewLine.frame.size.width) * CGFloat(currentPage)
        let xPosition: CGFloat = xCoor - xFromCenter/CGFloat(arrVC.count)
        constantViewLeft.constant = xPosition
    }
    
    
}
