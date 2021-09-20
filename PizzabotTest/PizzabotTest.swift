//
//  PizzabotTest.swift
//  PizzabotTest
//
//  Created by Siarhei Krumin on 13.09.21.
//

import XCTest

@testable import Pizzabot

class PizzabotTest: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    // MARK: - Parser

    func testParseDeliveryAreaSizeIsCorrect() throws {
        do {
            let parser = InputParser()
            let deliveryArea = try parser.parseDeliveryArea("5x5")
            XCTAssertEqual(deliveryArea.size, CGSize(width: 5, height: 5))
        } catch let error {
            XCTFail(error.localizedDescription)
        }
    }
    
    func testParseDeliveryAreaNotFoundThrownError() {
        var thrownError: Error?
        
        let parser = InputParser()
        XCTAssertThrowsError(try parser.parseDeliveryArea("(1,4)")) {
            thrownError = $0
        }
        XCTAssertEqual(thrownError as? ParsingError, .deliveryAreaSizeNotFoundOrWrong)
    }
    
    func testParsePoints() throws {
        do {
            let parser = InputParser()
            let points = try parser.parseDeliveryPoints("(1, 3) (4,4)")
            XCTAssertEqual(points, [Point(x: 1, y: 3), Point(x: 4, y: 4)])
        } catch let error {
            XCTFail(error.localizedDescription)
        }
    }
    
    func testParsePointsNotFoundThrownError() {
        var thrownError: Error?
        
        let parser = InputParser()
        XCTAssertThrowsError(try parser.parseDeliveryPoints("5x5")) {
            thrownError = $0
        }
        XCTAssertEqual(thrownError as? ParsingError, .deliveryPointsNotFound)
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
            XCTAssertEqual(validator.validateDeliveryPoints(filteredPoints) as? ValidatorError, .noPoints)
        } catch let error {
            XCTFail(error.localizedDescription)
        }
    }
    
    // MARK: - Pizzabot instructions
    
    func testPizzabot() throws {
        do {
            let inputString = "5x5 (1, 3) (4, 4)"
            
            let parser = InputParser()
            let points = try parser.parseDeliveryPoints(inputString)
            let deliveryArea = try parser.parseDeliveryArea(inputString)
            
            let pizzabot = Pizzabot()
            let routeInstructions = pizzabot.getRouteInstructions(area: deliveryArea, points: points)
            XCTAssertEqual(routeInstructions, "ENNNDEEEND")
        } catch let error {
            XCTFail(error.localizedDescription)
        }
    }
    
    // MARK: - Pizzabot movements
    
    func testEastMovements() {
        let pizzabot = Pizzabot()
        let steps = 3
        let movements = pizzabot.makeHorizontallMovements(steps: steps)
        XCTAssertEqual(movements, Array(repeating: .moveEast, count: steps))
    }
    
    func testWestMovements() {
        let pizzabot = Pizzabot()
        let steps = -3
        let movements = pizzabot.makeHorizontallMovements(steps: steps)
        XCTAssertEqual(movements, Array(repeating: .moveWest, count: abs(steps)))
    }
    
    func testNorthMovements() {
        let pizzabot = Pizzabot()
        let steps = 3
        let movements = pizzabot.makeVerticalMovements(steps: steps)
        XCTAssertEqual(movements, Array(repeating: .moveNorth, count: steps))
    }
    
    func testSouthMovements() {
        let pizzabot = Pizzabot()
        let steps = -3
        let movements = pizzabot.makeVerticalMovements(steps: steps)
        XCTAssertEqual(movements, Array(repeating: .moveSouth, count: abs(steps)))
    }
    
    func testHorizontallMovementsIsEmpty() {
        let pizzabot = Pizzabot()
        let steps = 0
        let movements = pizzabot.makeHorizontallMovements(steps: steps)
        XCTAssertEqual(movements, [])
    }
    
    func testVerticalMovementsIsEmpty() {
        let pizzabot = Pizzabot()
        let steps = 0
        let movements = pizzabot.makeVerticalMovements(steps: steps)
        XCTAssertEqual(movements, [])
    }
}
