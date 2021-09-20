//
//  PizzabotProtocol.swift
//  Pizzabot
//
//  Created by Siarhei Krumin on 17.09.21.
//

import Foundation

protocol PizzabotProtocol {
    func getRouteInstructions(area: DeliveryArea, points: [Point]) -> String
}
