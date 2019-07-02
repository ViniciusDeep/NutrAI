//
//  UIViewComponents+Extension.swift
//  NutrAI
//
//  Created by Vinicius Mangueira on 02/07/19.
//  Copyright © 2019 Vinicius Mangueira. All rights reserved.
//

import UIKit

extension UIImageView {
    
    func roundedImage(nameImage: String) -> UIImageView {
        let image = UIImageView(image: UIImage(named: nameImage))
        image.translatesAutoresizingMaskIntoConstraints = false
        image.layer.cornerRadius = 50
        image.clipsToBounds = true
        image.layer.shadowOffset = CGSize(width: 5, height: 5)
        image.layer.shadowRadius = 4
        image.layer.shadowColor = UIColor.black.cgColor
        image.layer.shadowOpacity = 1
        image.layer.borderColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        image.layer.borderWidth = 4
        return image
        
    }
}


extension UILabel {
    convenience init(text: String, font: UIFont?, textColor: UIColor?) {
        self.init()
        self.translatesAutoresizingMaskIntoConstraints = false
        self.text = text
        self.textColor = textColor
        self.font = font
    }
}
