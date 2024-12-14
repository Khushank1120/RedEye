//
//  Double.swift
//  RedEye
//
//  Created by Khushank on 12/5/24.
//

import Foundation


extension Double {
    private var currencyFormater: NumberFormatter {
        let formatter = NumberFormatter()
        formatter.minimumFractionDigits = 0
        formatter.maximumFractionDigits = 0
        return formatter
    }
    private var distanceFormater: NumberFormatter {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.minimumFractionDigits = 0
        formatter.maximumFractionDigits = 1
        return formatter
    }
    
    func toCurrency() -> String {
        return currencyFormater.string(for: self) ?? ""
    }
    
    func distanceInMilesString() -> String {
        return distanceFormater.string(for: self / 1600) ?? ""
    }
}
