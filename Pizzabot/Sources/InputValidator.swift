//
//  InputValidator.swift
//  Pizzabot
//
//  Created by Siarhei Krumin on 17.09.21.
//

import Foundation

final class InputValidator: Validator {
    func filterPointsInside(deliveryArea: DeliveryArea, points: [Point]) -> [Point] {
        return points.filter {
            if deliveryArea.containPointInside($0.toCGPoint()) {
                return true
            } else {
                debugPrint("point: \($0) was skipped due to out of bounds")
                return false
            }
        }
    }
    
    func validateDeliveryArea(_ deliveryArea: DeliveryArea) -> Error? {
        guard !deliveryArea.isEmpty else { return ValidatorError.emptyDeliveryArea }
        return nil
    }
    
    func validateDeliveryPoints(_ points: [Point]) -> Error? {
        guard points.count > 0 else { return ValidatorError.noPoints }
        return nil
    }
    
    func validateInput(_ input: String?) -> Error? {
        // If input command is nil or is empty we can't parse string
        guard let input = input, !input.isEmpty else {
            return ValidatorError.badInput
        }
        return nil
    }
}
