//
//  main.swift
//  Pizzabot
//
//  Created by Siarhei Krumin on 7.09.21.
//

import Foundation

private enum Message {
    static let enterCommand = "Enter command: "
    static let pizzabotResult = "Pizzabot instructions:"
}

private let validator = InputValidator()
private let parser = InputParser()
private let pizzabot = Pizzabot()

debugPrint(Message.enterCommand)

while let input = readLine() {
    do {
        if let error = validator.validateInput(input) {
            throw error
        }
        
        // Parse and validate delivery area
        let deliveryArea = try parser.parseDeliveryArea(input)
        if let error = validator.validateDeliveryArea(deliveryArea) {
            throw error
        }
        
        // Parse and validate input points
        let points = try parser.parseDeliveryPoints(input)
        let filteredPoints = validator.filterPointsInside(deliveryArea: deliveryArea, points: points)
        
        if let error = validator.validateDeliveryPoints(filteredPoints) {
            throw error
        }
        
        let route = pizzabot.getRouteInstructions(area: deliveryArea, points: filteredPoints)
        debugPrint("\(Message.pizzabotResult) \(route)")
    } catch {
        debugPrint(error.localizedDescription)
    }

    debugPrint(Message.enterCommand)
}

