//
//  Point.swift
//  Pizzabot
//
//  Created by Siarhei Krumin on 17.09.21.
//

import Foundation

struct Point: Pointable, Equatable {
    var x: Int
    var y: Int
    
    func toCGPoint() -> CGPoint {
        return .init(x: x, y: y)
    }
}
