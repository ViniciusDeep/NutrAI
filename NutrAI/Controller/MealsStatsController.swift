//
//  MealsStatsController.swift
//  NutrAI
//
//  Created by Vinicius Mangueira on 02/07/19.
//  Copyright © 2019 Vinicius Mangueira. All rights reserved.
//

import UIKit
import Charts

class MealsStatsController: UIViewController, ConfigurableView {
    var pieChart: PieChartView!
    
    
    var healthyEntry = PieChartDataEntry(value: 0)
    var unHealthyEntry = PieChartDataEntry(value: 0)
    
    var numberOfMeals = [PieChartDataEntry]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        pieChart = PieChartView()
        buildViewHierarchy()
        setupConstraints()
        updateChartData()
    }
    
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
    
    func buildViewHierarchy() {
        view.addSubview(pieChart)
    }
    
    func setupConstraints() {
        pieChart.fillSuperview()
    }
    
    
    
    
}
