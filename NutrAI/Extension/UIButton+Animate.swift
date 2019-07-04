//
//  UIButton+Animate.swift
//  NutrAI
//
//  Created by Thalys Viana on 04/07/19.
//  Copyright © 2019 Vinicius Mangueira. All rights reserved.
//

import UIKit

extension UIButton {
    func clickAnimation() {
        UIView.animateKeyframes(withDuration: 0.3, delay: 0, options: .beginFromCurrentState, animations: {
            UIView.addKeyframe(withRelativeStartTime: 0.15, relativeDuration: 0.15, animations: {
                self.transform = CGAffineTransform(scaleX: 0.8, y: 0.8)
            })
            UIView.addKeyframe(withRelativeStartTime: 0.3, relativeDuration: 0.3, animations: {
                self.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
            })
        })
    }
    
    func pulsate() {
        let pulse = CASpringAnimation(keyPath: "transform.scale")
        pulse.duration = 0.8
        pulse.fromValue = 0.95
        pulse.toValue = 1.0
        pulse.autoreverses = false
        pulse.initialVelocity = 0.2
        pulse.damping = 1.0
        
        layer.add(pulse, forKey: nil)
    }
}
