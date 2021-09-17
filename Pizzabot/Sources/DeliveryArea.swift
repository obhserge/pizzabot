//
//  File.swift
//  Pizzabot
//
//  Created by Siarhei Krumin on 17.09.21.
//

import Foundation

struct DeliveryArea: Area {
    var size: CGSize
    
    var isEmpty: Bool {
        return size.height == 0 || size.width == 0
    }
    
    func containPointInside(_ point: CGPoint) -> Bool {
        let playableRect = CGRect(origin: .zero, size: size)
        return playableRect.contains(point)
    }
}
