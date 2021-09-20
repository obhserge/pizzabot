//
//  Pizzabot.swift
//  Pizzabot
//
//  Created by Siarhei Krumin on 14.09.21.
//

import Foundation

final class Pizzabot: PizzabotProtocol {
    
    func getRouteInstructions(area: DeliveryArea, points: [Point]) -> String {
        
        var botPosition = Point(x: 0, y: 0)
        
        var instructions: [ActionType] = []
        for point in points {
            // Calculate movements by X and Y and get set of instructions
            let movementsByX = point.x - botPosition.x
            let movementsByY = point.y - botPosition.y
            instructions.append(contentsOf: makeHorizontallMovements(steps: movementsByX))
            instructions.append(contentsOf: makeVerticalMovements(steps: movementsByY))
            instructions.append(.dropPizza)
            
            botPosition = point
        }
        
        return instructions.map { $0.rawValue }.joined()
    }

    func makeHorizontallMovements(steps: Int) -> [ActionType] {
        guard steps != 0 else { return [] }
        
        // If value is positive it means we should move east
        // Otherwise - move west.
        if steps > 0 {
            return Array(repeating: .moveEast, count: steps)
        } else {
            return Array(repeating: .moveWest, count: abs(steps))
        }
    }

    func makeVerticalMovements(steps: Int) -> [ActionType] {
        guard steps != 0 else { return [] }
        
        // If value is positive it means we should move north
        // Otherwise - move south.
        if steps > 0 {
            return Array(repeating: .moveNorth, count: steps)
        } else {
            return Array(repeating: .moveSouth, count: abs(steps))
        }
    }
}
