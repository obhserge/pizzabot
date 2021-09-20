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
