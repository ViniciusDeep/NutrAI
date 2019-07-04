//
//  ViewController.swift
//  NutrAI
//
//  Created by Vinicius Mangueira on 02/07/19.
//  Copyright © 2019 Vinicius Mangueira. All rights reserved.
//

import UIKit

class CustomTabBarController: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()
        setComponentsInTab()
        // Do any additional setup after loading the view.
    }

    fileprivate func setComponentsInTab() {
        viewControllers = [
            createNav(viewController: MealsListController(), title: "NutrAI", imageNamed: "tab1"),
            createNav(viewController: MealsStatsController(), title: "Stats", imageNamed: "tab2"),
        ]
    }
    fileprivate func createNav(viewController: UIViewController, title: String, imageNamed: String) -> UINavigationController {
        let navVc = UINavigationController(rootViewController: viewController)
        viewController.view.backgroundColor = .white
        navVc.navigationBar.barTintColor = .white
        navVc.navigationBar.prefersLargeTitles = true
        viewController.navigationItem.title = title
        navVc.tabBarItem.title = title
        navVc.tabBarItem.image = UIImage(named: imageNamed)
        return navVc
    }
}

