//
//  TipsMeals.swift
//  NutrAI
//
//  Created by Vinicius Mangueira on 03/07/19.
//  Copyright © 2019 Vinicius Mangueira. All rights reserved.
//

import UIKit
import SDWebImage

class TipsMealsController: UITableViewController {
    
    var mealsDB: [MealDB]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        TheMealDBManager.getMeals { (meals, error) in
            self.mealsDB = meals
        }
    }
}

extension TipsMealsController {
    fileprivate func setupTableView() {
            self.tableView.register(cellType: MealsListCell.self)
        }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return mealsDB.count
    }
d
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(for: indexPath, cellType: MealsListCell.self)
        cell.nameMeal.text = mealsDB[indexPath.row].strMeal
        cell.calorieMeal.text = mealsDB[indexPath.row].strCategory
        guard let url = URL(string: mealsDB[indexPath.row].strMealThumb) else {return cell}
        cell.imageMeal.sd_setImage(with: url)
        return cell
    }
}
