//
//  MealIdentifierView.swift
//  NutrAI
//
//  Created by Thalys Viana on 04/07/19.
//  Copyright © 2019 Vinicius Mangueira. All rights reserved.
//

import UIKit

protocol MealIdentifierViewDelegate: class {
    func addButtonDidClick()
    func cancelButtonDidClick()
}

class MealIdentifierView: UIView, ConfigurableView {
    
    lazy var mealImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.backgroundColor = .lightGray
        return imageView
    }()
    
    lazy var mealNameTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "Meal name"
        return textField
    }()
    
    lazy var buttonsStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [self.cancelButton, self.addButon])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.distribution = .equalCentering
        stackView.axis = .horizontal
        stackView.spacing = 24
        return stackView
    }()
    
    lazy var addButon: CustomButton = {
        let button = CustomButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Add", for: .normal)
        button.addTarget(self, action: #selector(addButtonClicked), for: .touchUpInside)
        return button
    }()
    
    lazy var cancelButton: CustomButton = {
        let button = CustomButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Cancel", for: .normal)
        button.addTarget(self, action: #selector(cancelButtonClicked), for: .touchUpInside)
        return button
    }()
    
    weak var delegate: MealIdentifierViewDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func willMove(toSuperview newSuperview: UIView?) {
        buildViewHierarchy()
        setupConstraints()
    }
    
    func buildViewHierarchy() {
        addSubviews([mealImageView, mealNameTextField, buttonsStackView])
    }
    
    func setupConstraints() {
        // mealImageView constraints
        NSLayoutConstraint.activate([
            mealImageView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 64),
            mealImageView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            mealImageView.widthAnchor.constraint(equalToConstant: 200),
            mealImageView.heightAnchor.constraint(equalTo: mealImageView.widthAnchor)
        ])
        
        // mealNameTextField constraints
        NSLayoutConstraint.activate([
            mealNameTextField.topAnchor.constraint(equalTo: mealImageView.bottomAnchor, constant: 40),
            mealNameTextField.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 40),
            mealNameTextField.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -40)
        ])
        
        // buttonsStackView constrains
        NSLayoutConstraint.activate([
            buttonsStackView.topAnchor.constraint(equalTo: mealNameTextField.bottomAnchor, constant: 80),
            buttonsStackView.leadingAnchor.constraint(equalTo: mealNameTextField.leadingAnchor),
            buttonsStackView.trailingAnchor.constraint(equalTo: mealNameTextField.trailingAnchor)
        ])
        
        // addButton constraints
        NSLayoutConstraint.activate([
            addButon.widthAnchor.constraint(equalToConstant: 100),
            addButon.heightAnchor.constraint(equalToConstant: 40),
        ])
        
        // cancelButton constraints
        NSLayoutConstraint.activate([
            cancelButton.widthAnchor.constraint(equalTo: addButon.widthAnchor),
            cancelButton.heightAnchor.constraint(equalTo: addButon.heightAnchor)
        ])
    }
}

extension MealIdentifierView {
    @objc func addButtonClicked(_sender: UIButton) {
        delegate?.addButtonDidClick()
    }
    
    @objc func cancelButtonClicked(_sender: UIButton) {
        delegate?.cancelButtonDidClick()
    }
}
