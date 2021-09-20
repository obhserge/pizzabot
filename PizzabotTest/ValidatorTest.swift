//
//  ValidatorTest.swift
//  Pizzabot
//
//  Created by Siarhei Krumin on 20.09.21.
//

import XCTest

@testable import Pizzabot

class ValidatorTest: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    // MARK: - Validator
    
    func testValidateDeliveryAreaHasEmptySize() throws {
        do {
            let parser = InputParser()
            let validator = InputValidator()
            
            let deliveryArea = try parser.parseDeliveryArea("0x5")
            XCTAssertEqual(validator.validateDeliveryArea(deliveryArea) as? ValidatorError, .emptyDeliveryArea)
        } catch let error {
            XCTFail(error.localizedDescription)
        }
    }
    
    func testValidateNoPoints() throws {
        do {
            let parser = InputParser()
            let validator = InputValidator()
            
            let inputString = "5x5 (6,3) (4,10)"
            let deliveryArea = try parser.parseDeliveryArea(inputString)
            let points = try parser.parseDeliveryPoints(inputString)
            let filteredPoints = validator.filterPointsInside(deliveryArea: deliveryArea, points: points)
            XCTAssertEqual(validator.validateDeliveryPoints(filteredPoints) as? ValidatorError, .pointsNotFound)
        } catch let error {
            XCTFail(error.localizedDescription)
        }
    }
}
