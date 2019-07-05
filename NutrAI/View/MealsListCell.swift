//
//  MealsListCell.swift
//  NutrAI
//
//  Created by Vinicius Mangueira on 02/07/19.
//  Copyright © 2019 Vinicius Mangueira. All rights reserved.
//

import UIKit

class MealsListCell: UITableViewCell, ConfigurableView, Reusable {
    
    lazy var imageMeal = UIImageView().roundedImage(nameImage: "meal")
    
    lazy var nameMeal = UILabel(text: "Crip Beef Tendon", font:   UIFont.init(name: "Futura", size: 16), textColor: .black)
    
    lazy var calorieMeal = UILabel(text: "325cl", font: UIFont.init(name: "Futura", size: 10), textColor: .gray)
    

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        buildViewHierarchy()
        setupConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupCell(meal: Meal) {
        imageMeal.image =  UIImage(data: meal.imageData)
        nameMeal.text = meal.name
    }
    
    func buildViewHierarchy() {
        addSubview(imageMeal)
        addSubview(nameMeal)
        addSubview(calorieMeal)
    }

    func setupConstraints() {
        NSLayoutConstraint.activate([
                self.imageMeal.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
                self.imageMeal.topAnchor.constraint(equalTo: self.topAnchor, constant: 10),
                self.imageMeal.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -10),
                self.imageMeal.widthAnchor.constraint(equalToConstant: 100),
                self.imageMeal.heightAnchor.constraint(equalToConstant: 100),
            ])
        
        NSLayoutConstraint.activate([
            self.nameMeal.leadingAnchor.constraint(equalTo: self.imageMeal.trailingAnchor, constant: 10),
            self.nameMeal.topAnchor.constraint(equalTo: self.imageMeal.topAnchor, constant: 10)
            ])
        
        NSLayoutConstraint.activate([
            self.calorieMeal.leadingAnchor.constraint(equalTo: self.nameMeal.leadingAnchor),
            self.calorieMeal.topAnchor.constraint(equalTo: self.nameMeal
                .bottomAnchor, constant: 5)
            
            ])
    }
}

