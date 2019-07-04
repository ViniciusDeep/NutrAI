//
//  ViewController.swift
//  NutrAI
//
//  Created by Vinicius Mangueira on 02/07/19.
//  Copyright © 2019 Vinicius Mangueira. All rights reserved.
//

import UIKit

class MealsListController: UITableViewController {
    
    let schedules = [Schedule(name: "BreakFast", imageNamed: "breakfast"),Schedule(name: "Lunch", imageNamed: "lunch"),Schedule(name: "Dinner", imageNamed: "dinner")]
    
    var meals: [Meal]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addMealButtonClicked))
        setupTableView()
    }
   
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let coreStack = CoreDao<Meal>(with: "NutriAI-Data")
        meals = coreStack.fetchAll()
        tableView.reloadData()
    }
    
}

extension MealsListController {
    @objc func addMealButtonClicked(_ sender: Any) {
        let mealIdentifierVC = MealIdentifierController()
        present(mealIdentifierVC, animated: true)
    }
}

extension MealsListController {
    fileprivate func setupTableView() {
        tableView.tableFooterView = UIView()
        tableView.register(cellType: MealsListCell.self)
        tableView.separatorStyle = .none
        tableView.allowsSelection = false
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = MealsListHeader()
        header.schedule = schedules[section]
        return header
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return meals?.count ?? 0
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return schedules.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(for: indexPath, cellType: MealsListCell.self)
        cell.nameMeal.text = meals?[indexPath.row].name ?? ""
        cell.imageMeal.image = UIImage(data: meals?[indexPath.row].imageData ?? Data())
        return cell
    }
}
