//
//  MealIdentifierController.swift
//  NutrAI
//
//  Created by Thalys Viana on 04/07/19.
//  Copyright © 2019 Vinicius Mangueira. All rights reserved.
//

import UIKit

final class MealIdentifierController: UIViewController, HasCustomView {
    
    typealias CustomView = MealIdentifierView
    
    let imagePicker = UIImagePickerController()
    
    var model: Food101!
    
    var meal: Meal!
    
    override func loadView() {
        let mealIdentifierView = CustomView()
        mealIdentifierView.delegate = self
        imagePicker.delegate = self
        view = mealIdentifierView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        model = Food101()
    }
}

// MARK: - Actions
extension MealIdentifierController: MealIdentifierViewDelegate {
    func addButtonDidClick() {
        guard let meal = meal else {
            print("Meal not loaded")
            return
        }
        dismiss(animated: true)
    }
    
    func cancelButtonDidClick() {
        dismiss(animated: true)
    }
    
    func photoImageViewDidClick() {
        let alertController = Alert.showAlert { (sourceType) in
            switch sourceType {
            case .camera:
                self.openCamera()
            case .library:
                self.openLibrary()
            case .none:
                print("Cancel choose photo action")
            }
        }
        present(alertController, animated: true)
    }
    
    func openCamera() {
        if(UIImagePickerController .isSourceTypeAvailable(.camera)) {
            imagePicker.sourceType = .camera
            imagePicker.allowsEditing = true
            self.present(imagePicker, animated: true, completion: nil)
        }
        else {
            Alert.missingCamera { (alert) in
                self.present(alert, animated: true, completion: nil)
            }
        }
    }
    
    func openLibrary() {
        imagePicker.sourceType = .photoLibrary
        imagePicker.allowsEditing = true
        self.present(imagePicker, animated: true, completion: nil)
    }
}

extension MealIdentifierController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        picker.dismiss(animated: true)
        
        guard let image = info[.originalImage] as? UIImage else {
            return
        }
        
        let resizableImage = CoreMLHelper.resizableImageForModel(image: image, size: CGSize(width: 299, height: 299))
        
        guard let pixelBuffer = resizableImage.pixelBuffer else {
            return
        }
        
        // Assign new resizable image here
        customView.setMealImage(image)
        customView.hideImageViewDescriptionLabel()
        
        // Get model prediction
        guard let prediction = try? model.prediction(image: pixelBuffer) else {
            return
        }
        
        // Display results
        print("I think this is a \(prediction.classLabel)")
        
        // Create meal data
        guard let imageData = image.pngData() else {
            print("Could not load image")
            return
        }
        
        let coreStack = CoreDao<Meal>(with: "NutriAI-Data")
        meal = coreStack.new()
        meal.name = prediction.classLabel
        meal.imageData = imageData
        meal.timestamp = Int32(TimeManager.getCurrentTimer()) ?? 0
        meal.setSchedule()
        coreStack.insert(object: meal)
        
        customView.setMealName(name: meal.name ?? "")
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true)
    }
}

