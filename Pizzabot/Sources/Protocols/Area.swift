//
//  Area.swift
//  Pizzabot
//
//  Created by Siarhei Krumin on 17.09.21.
//

import Foundation

protocol Area {
    var size: CGSize { get set }
    var isEmpty: Bool { get }
    func containPointInside(_ point: CGPoint) -> Bool
}
