//
//  String+AccessibilityTraining.swift
//  accessibiliytraining_ios
//
//  Created by Lun Lam on 04/06/2021.
//

import Foundation

extension String {
    
    var accessibilityLabelDate: String {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd/MM/yyyy"
        if let date = formatter.date(from: self) {
            formatter.dateStyle = .long
            return formatter.string(from: date)
        }
        return self
    }
    
}
