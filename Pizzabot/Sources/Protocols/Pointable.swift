//
//  Pointable.swift
//  Pizzabot
//
//  Created by Siarhei Krumin on 17.09.21.
//

import Foundation

protocol Pointable {
    var x: Int { get set }
    var y: Int { get set }
    func toCGPoint() -> CGPoint
}
