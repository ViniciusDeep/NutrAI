//
//  MealIdentifierController.swift
//  NutrAI
//
//  Created by Thalys Viana on 04/07/19.
//  Copyright © 2019 Vinicius Mangueira. All rights reserved.
//

import UIKit

final class MealIdentifierController: UIViewController, HasCustomView {
    
    typealias CustomView = MealIdentifierView
    
    override func loadView() {
        let mealIdentifierView = CustomView()
        view = mealIdentifierView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
    }
}

// MARK: - Actions
extension MealIdentifierController: MealIdentifierViewDelegate {
    func addButtonDidClick() {
        
    }
    
    func cancelButtonDidClick() {
        
    }
    
    func photoImageViewDidClick() {
        
    }
}
