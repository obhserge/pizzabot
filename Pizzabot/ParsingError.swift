//
//  ParsingError.swift
//  Pizzabot
//
//  Created by Siarhei Krumin on 7.09.21.
//

import Foundation

enum ParsingError: Error {
    case inputDataIsEmpty
    case gridSizeNotFound
    case badGridSize
}

extension ParsingError: LocalizedError {
    var errorDescription: String? {
        switch self {
        case .inputDataIsEmpty:
            return "Input data is empty. Try again"
        case .gridSizeNotFound:
            return "Grid size has not found or has wrong format"
        case .badGridSize:
            return "Grid size has wrong dimension"
        }
    }
}
