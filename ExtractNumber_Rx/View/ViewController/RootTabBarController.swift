//
//  RootViewController.swift
//  ExtractNumber_Rx
//
//  Created by 김태성 on 2023/03/04.
//

import UIKit

class RootTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        print("viewDidLoad")
        print(self.tabBar.frame)
        self.tabBar.backgroundColor = .white
        configureViewController()

    }
    
    func configureViewController() {
        let firstExtractViewController = ExtractViewController()
        let secondsExtractViewController = PreViewController()
        //self.viewControllers = [firstExtractViewController]
        
        let tabViewController = TabViewController(title: "Test", backgroundColor: .red)
        self.viewControllers = [firstExtractViewController, secondsExtractViewController]
        
        let firstTabItem = UITabBarItem(title: "first", image: UIImage(systemName: "house"), tag: 0)
        let secondsTabItem = UITabBarItem(title: "seconds", image: UIImage(systemName: "gearshape.fill"), tag: 1)
        
        firstExtractViewController.tabBarItem = firstTabItem
        secondsExtractViewController.tabBarItem = secondsTabItem
        //secondsExtractViewController.tabBarItem = secondsTabItem
    }
}
