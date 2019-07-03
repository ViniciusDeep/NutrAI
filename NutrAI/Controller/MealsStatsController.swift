//
//  MealsStatsController.swift
//  NutrAI
//
//  Created by Vinicius Mangueira on 02/07/19.
//  Copyright © 2019 Vinicius Mangueira. All rights reserved.
//

import UIKit
import Charts

fileprivate protocol ConfigurableChart: class {
    func updateChartData()
}

class MealsStatsController: UIViewController, ConfigurableView {
    var pieChart = PieChartView(translatesAutoresizingMaskIntoConstraints: false)
    
    var healthyEntry = PieChartDataEntry(value: 0)
    var unHealthyEntry = PieChartDataEntry(value: 0)
    
    var numberOfMeals = [PieChartDataEntry]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        buildViewHierarchy()
        setupConstraints()
        updateChartData()
    }
    func buildViewHierarchy() {
        view.addSubview(pieChart)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            pieChart.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            pieChart.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            pieChart.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            pieChart.topAnchor.constraint(equalTo: self.view.topAnchor),
            ])
    }
}

extension MealsStatsController: ConfigurableChart {
        fileprivate func updateChartData() {
        pieChart.noDataText = "You dont have dates, set your meals"
        pieChart.chartDescription?.text = "Health life"
        healthyEntry.label = "Health"
        healthyEntry.value = 80
        unHealthyEntry.value = 20
        unHealthyEntry.label = "Not Health"
        numberOfMeals = [healthyEntry, unHealthyEntry]
        let chartDataSet = PieChartDataSet(entries: numberOfMeals, label: nil)
        let chartData = PieChartData(dataSet: chartDataSet)
        let colors = [UIColor(cgColor: #colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1).cgColor),UIColor(cgColor: #colorLiteral(red: 0.7406273484, green: 0.07541330861, blue: 0.3174545584, alpha: 1).cgColor)]
        chartDataSet.colors = colors
        pieChart.data = chartData
    }
    
}
