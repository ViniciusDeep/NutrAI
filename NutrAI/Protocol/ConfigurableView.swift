//
//  ConfigurableView.swift
//  NutrAI
//
//  Created by Vinicius Mangueira on 02/07/19.
//  Copyright © 2019 Vinicius Mangueira. All rights reserved.
//

import UIKit

protocol ConfigurableView: class {
    func buildViewHierarchy()
    func setupConstraints()
}
