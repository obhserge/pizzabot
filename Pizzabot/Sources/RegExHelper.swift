//
//  RegExHelper.swift
//  Pizzabot
//
//  Created by Siarhei Krumin on 17.09.21.
//

import Foundation

final class RegExHelper {
    
    static func allMatches(string: String, pattern: String) -> [NSTextCheckingResult] {
        let pattern = defaultRegularExpression(pattern: pattern)
        
        return pattern.matches(in: string, options: [], range: NSRange(location: 0, length: string.count))
    }
    
    static func firstMatch(string: String, pattern: String) -> NSTextCheckingResult? {
        
        let pattern = defaultRegularExpression(pattern: pattern)
        
        return pattern.firstMatch(in: string, options: [], range: NSRange(location: 0, length: string.count))
    }
    
    private static func defaultRegularExpression(pattern: String) -> NSRegularExpression {
        let options: NSRegularExpression.Options = [.anchorsMatchLines]
        return try! NSRegularExpression(pattern: pattern, options: options)
    }
}
