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
    
    var proteinEntry = PieChartDataEntry(value: 0)
    var carboidrateEntry = PieChartDataEntry(value: 0)
    var fatEntry = PieChartDataEntry(value: 0)
    var alcoholEntry = PieChartDataEntry(value: 0)
    
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
        proteinEntry.label = "Proteins"
        proteinEntry.value = 40
        carboidrateEntry.value = 20
        carboidrateEntry.label = "Carboidrates"
        
        fatEntry.label = "Fats"
        fatEntry.value = 20
        alcoholEntry.value = 20
        alcoholEntry.label = "Alcohol"
            
            
            
        numberOfMeals = [proteinEntry, carboidrateEntry, fatEntry, alcoholEntry]
        let chartDataSet = PieChartDataSet(entries: numberOfMeals, label: nil)
        let chartData = PieChartData(dataSet: chartDataSet)
        let colors = [UIColor(cgColor: #colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1).cgColor),UIColor(cgColor: #colorLiteral(red: 0.7406273484, green: 0.07541330861, blue: 0.3174545584, alpha: 1).cgColor),UIColor(cgColor: #colorLiteral(red: 0.2196078449, green: 0.007843137719, blue: 0.8549019694, alpha: 1).cgColor),UIColor(cgColor: #colorLiteral(red: 0.2588235438, green: 0.7568627596, blue: 0.9686274529, alpha: 1).cgColor)]
        chartDataSet.colors = colors
        pieChart.data = chartData
    }
    
}
