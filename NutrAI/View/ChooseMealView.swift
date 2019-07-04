//
//  MoreCollectionView.swift
//  NutrAI
//
//  Created by Vinicius Mangueira on 03/07/19.
//  Copyright © 2019 Vinicius Mangueira. All rights reserved.
//

import UIKit


class ChooseMealView: UICollectionViewCell {
    
    lazy var imageBanner: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "meal"))
        imageView.contentMode = UIView.ContentMode.scaleAspectFit
        return imageView
    }()
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        layer.cornerRadius = 16
        buildViewHierarchy()
        setupConstraints()
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("Error in build view")
    }
    func buildViewHierarchy() {
        self.addSubview(imageBanner)
    }
    func setupConstraints() {
        self.imageBanner.centerInSuperview()
    }

}
