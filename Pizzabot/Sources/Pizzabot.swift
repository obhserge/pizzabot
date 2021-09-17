//
//  Pizzabot.swift
//  Pizzabot
//
//  Created by Siarhei Krumin on 14.09.21.
//

import Foundation

class Pizzabot {
    
    enum RegularExpression: String {
        // [0-9]{1,} - from 0-9 match at least once, but potentially any number more.
        case areaSize = "[0-9]{1,}x[0-9]{1,}"
        case deliveryPoints = "([0-9]{1,},[ ]?[0-9]{1,})"
    }
    
    func start() {
        print("Enter command: ")
        
        let input = readLine()
        do {
            let route = try getRouteInstructions(input)
            print("Pizzabot movements:", route)
        } catch {
            print(error.localizedDescription)
        }
    }

    func getRouteInstructions(_ input: String?) throws -> String {
        // If input command is nil or is empty we can't parse string
        guard let input = input, !input.isEmpty else {
            throw ParsingError.inputDataIsEmpty
        }
        do {
            // Parse playground size
            let areaSize = try parseDeliveryAreaSize(input)
            // Create playground with size
            let deliveryArea = DeliveryArea(size: areaSize)
            // Parse input points
            let points = try parseDeliveryPoints(input)
            // Get pizzabot instructions
            return try makeRoute(area: deliveryArea, points: points)
        } catch {
            throw error
        }
    }

    func parseDeliveryAreaSize(_ input: String) throws -> CGSize {
        let options: NSRegularExpression.Options = [.anchorsMatchLines]
        
        let pattern = try! NSRegularExpression(pattern: RegularExpression.areaSize.rawValue, options: options)

        let grid = pattern.firstMatch(in: input, options: [], range: NSRange(location: 0, length: input.count))

        guard let matchString = input[grid?.range], matchString.components(separatedBy: "x").count > 0 else {
            throw ParsingError.gridSizeNotFound
        }
            
        let characters = matchString.components(separatedBy: "x")
            
        guard let xDimension = Int(characters.first),
              let yDimension = Int(characters.last) else { throw ParsingError.badGridSize }
        
        return CGSize(width: xDimension, height: yDimension)
    }

    func parseDeliveryPoints(_ input: String) throws -> [Point] {
        let options: NSRegularExpression.Options = [.anchorsMatchLines]
        
        let pattern = try! NSRegularExpression(pattern: RegularExpression.deliveryPoints.rawValue, options: options)
        
        let matches = pattern.matches(in: input, options: [], range: NSRange(location: 0, length: input.count))

        guard matches.count > 0 else {
            throw ParsingError.gridSizeNotFound
        }
        
        var points: [Point] = []
        
        for match in matches {
            guard let matchString = input[match.range] else {
                continue
            }
            let componentsNoSpaces = matchString
                .replacingOccurrences(of: " ", with: "")
            
            let components =
                componentsNoSpaces.components(separatedBy: ",")
            
            guard let xValue = Int(components.first),
                  let yValue = Int(components.last) else {
                continue
            }
            
            points.append(Point(x: xValue, y: yValue))
        }
        
        return points
    }

    func makeRoute(area: DeliveryArea, points: [Point]) throws -> String {
        guard points.count > 0, !area.isEmpty else {
            throw RoutingError.badInputData
        }
        
        var botPosition = Point(x: 0, y: 0)
        
        var instructions: [ActionType] = []
        for point in points {
            // Check if the point inside our area if not - skip
            if !area.containPointInside(point.toCGPoint()) {
                print("point: \(point) was skipped due to out of bounds")
                continue
            }
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
