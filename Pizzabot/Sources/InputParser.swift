//
//  Parser.swift
//  Pizzabot
//
//  Created by Siarhei Krumin on 20.09.21.
//

import Foundation

final class InputParser: Parser {
    
    func parseDeliveryArea(_ input: String) throws -> DeliveryArea {
        let gridResult = RegExHelper.firstMatch(string: input, pattern: RegExHelper.RegularExpression.areaSize)

        guard let matchString = input[gridResult?.range], matchString.components(separatedBy: "x").count > 0 else {
            throw ParsingError.deliveryAreaSizeNotFoundOrWrong
        }
            
        let characters = matchString.components(separatedBy: "x")
            
        guard let xDimension = Int(characters.first),
              let yDimension = Int(characters.last) else { throw ParsingError.deliveryAreaSizeNotFoundOrWrong }
        
        let areaSize = CGSize(width: xDimension, height: yDimension)
        
        return DeliveryArea(size: areaSize)
    }

    func parseDeliveryPoints(_ input: String) throws -> [Point] {
        let matches = RegExHelper.allMatches(string: input, pattern: RegExHelper.RegularExpression.deliveryPoints)
        
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
        
        if points.count > 0 {
            return points
        } else {
            throw ParsingError.deliveryPointsNotFound
        }
    }
}
