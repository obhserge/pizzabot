//
//  Int+Extensions.swift
//  Pizzabot
//
//  Created by Siarhei Krumin on 13.09.21.
//

import Foundation

extension Int {
    public init?(_ description: String?) {
        guard let description = description else {
            return nil
        }
        self.init(description)
    }
}
