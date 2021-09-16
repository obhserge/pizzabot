//
//  String+Extensions.swift
//  Pizzabot
//
//  Created by Siarhei Krumin on 13.09.21.
//

import Foundation

extension String {
    subscript(range: NSRange?) -> String? {
        guard let nsrange = range, let swiftRange = Range(nsrange, in: self) else { return nil }
        return String(self[swiftRange])
    }
}
