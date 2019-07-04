//
//  ChooseMealController.swift
//  NutrAI
//
//  Created by Vinicius Mangueira on 03/07/19.
//  Copyright © 2019 Vinicius Mangueira. All rights reserved.
//

import UIKit

class ChooseMealController: BaseCollectionController{
   
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollection()
    }
}

extension ChooseMealController: UICollectionViewDelegateFlowLayout {
    
    fileprivate func setupCollection() {
            collectionView.register(ChooseMealView.self, forCellWithReuseIdentifier: "cellId")
            collectionView.backgroundColor = .white
        }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellId", for: indexPath) as! ChooseMealView
        return cell
    }
}
