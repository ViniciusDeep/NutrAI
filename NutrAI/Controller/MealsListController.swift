//
//  ViewController.swift
//  NutrAI
//
//  Created by Vinicius Mangueira on 02/07/19.
//  Copyright © 2019 Vinicius Mangueira. All rights reserved.
//

import UIKit

class MealsListController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: nil)
        
        
    }

}
