//
//  Parser.swift
//  Pizzabot
//
//  Created by Siarhei Krumin on 20.09.21.
//

import Foundation

// MARK: - Protocol

protocol Parser {
    func parseDeliveryArea(_ input: String) throws -> DeliveryArea
    func parseDeliveryPoints(_ input: String) throws -> [Point]
}

// MARK: - Parsing errors

enum ParsingError: Error, Equatable {
    case deliveryAreaSizeNotFoundOrWrong
    case deliveryPointsNotFound
}

extension ParsingError: LocalizedError {
    var errorDescription: String? {
        switch self {
        case .deliveryPointsNotFound:
            return "Parsing error. Delivery points has not been found"
        case .deliveryAreaSizeNotFoundOrWrong:
            return "Parsing error. Delivery area has not found or has wrong format"
        }
    }
}
