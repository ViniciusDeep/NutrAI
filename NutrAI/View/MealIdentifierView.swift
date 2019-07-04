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
    func photoImageViewDidClick()
}

class MealIdentifierView: UIView, ConfigurableView {
    
    lazy var mealImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.backgroundColor = .lightGray
        imageView.isUserInteractionEnabled = true
        imageView.layer.cornerRadius = 8
        imageView.clipsToBounds = true
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(photoImageViewClicked))
        imageView.addGestureRecognizer(tapGesture)
        return imageView
    }()
    
    lazy var imageViewDescriptionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Choose a photo"
        return label
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
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        self.addGestureRecognizer(tapGesture)
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
        mealImageView.addSubview(imageViewDescriptionLabel)
    }
    
    func setupConstraints() {
        // mealImageView constraints
        NSLayoutConstraint.activate([
            mealImageView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 64),
            mealImageView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            mealImageView.widthAnchor.constraint(equalToConstant: 200),
            mealImageView.heightAnchor.constraint(equalTo: mealImageView.widthAnchor)
        ])
        
        // imageViewDescriptionLabel constraints
        NSLayoutConstraint.activate([
            imageViewDescriptionLabel.centerXAnchor.constraint(equalTo: mealImageView.centerXAnchor),
            imageViewDescriptionLabel.centerYAnchor.constraint(equalTo: mealImageView.centerYAnchor)
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
    @objc func addButtonClicked(_ sender: UIButton) {
        sender.clickAnimation()
        delegate?.addButtonDidClick()
    }
    
    @objc func cancelButtonClicked(_ sender: UIButton) {
        sender.clickAnimation()
        delegate?.cancelButtonDidClick()
    }
    
    @objc func photoImageViewClicked(_ gesture: UITapGestureRecognizer) {
        delegate?.photoImageViewDidClick()
    }
    
    @objc func dismissKeyboard(_ gesture: UITapGestureRecognizer) {
        self.endEditing(true)
    }
    
    func setMealImage(_ image: UIImage) {
        mealImageView.image = image
    }
    
    func setMealName(name: String) {
        mealNameTextField.text = name
    }
    
    func hideImageViewDescriptionLabel() {
        imageViewDescriptionLabel.isHidden = true
    }
}
