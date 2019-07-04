//
//  Alert.swift
//  NutrAI
//
//  Created by Thalys Viana on 04/07/19.
//  Copyright © 2019 Vinicius Mangueira. All rights reserved.
//

import UIKit

enum SourceType: String {
    case library = "library"
    case camera = "camera"
    case none
}

enum AlertCase {
    case library(sourceType: SourceType)
    case camera(sourceType: SourceType)
}

final class Alert {
    static func showAlert(completion: @escaping (SourceType) -> Void) -> UIAlertController {
        let alertController = UIAlertController(title: "Choose a photo", message: nil, preferredStyle: .actionSheet)
        
        let libraryAction = UIAlertAction(title: "Library", style: .default) { (action) in
            completion(.library)
        }
        let cameraAction = UIAlertAction(title: "Camera", style: .default) { (action) in
            completion(.camera)
        }
        let cancelCancel = UIAlertAction(title: "Cancel", style: .cancel) { (action) in
            completion(.none)
        }
        
        alertController.addAction(libraryAction)
        alertController.addAction(cameraAction)
        alertController.addAction(cancelCancel)
        
        return alertController
    }
    
    static func missingCamera(completion: (UIAlertController) -> Void) {
        let alertController = UIAlertController(title: "Warning", message: "You don't have camera", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(okAction)
        completion(alertController)
    }
}
