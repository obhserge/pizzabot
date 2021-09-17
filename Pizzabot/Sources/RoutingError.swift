//
//  RoutingError.swift
//  Pizzabot
//
//  Created by Siarhei Krumin on 7.09.21.
//

import Foundation

enum RoutingError: Error {
    case badInputData
}

extension RoutingError: LocalizedError {
    var errorDescription: String? {
        switch self {
        case .badInputData:
            return "Oops. Entered data has incorrect format."
        }
    }
}
