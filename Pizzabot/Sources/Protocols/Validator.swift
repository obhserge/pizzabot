//
//  Validator.swift
//  Pizzabot
//
//  Created by Siarhei Krumin on 20.09.21.
//

import Foundation

// MARK: - Protocol

protocol Validator {
    func validateInput(_ input: String?) -> Error?
    func validateDeliveryArea(_ deliveryArea: DeliveryArea) -> Error?
    func validateDeliveryPoints(_ points: [Point]) -> Error?
    func filterPointsInside(deliveryArea: DeliveryArea, points: [Point]) -> [Point]
}

// MARK: - Validator Errors

enum ValidatorError: Error, Equatable {
    case badInput
    case pointsNotFound
    case emptyDeliveryArea
}

extension ValidatorError: LocalizedError {
    var errorDescription: String? {
        switch self {
        case .badInput:
            return "Validation error. Bad input data"
        case .pointsNotFound:
            return "Validation error. Delivery points has not been found"
        case .emptyDeliveryArea:
            return "Validation error. Delivery area is empty"
        }
    }
}
