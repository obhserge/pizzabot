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

    func testParseDeliveryAreaSize() throws {
        do {
            let pizzabot = Pizzabot()
            let gridSize = try pizzabot.parseDeliveryAreaSize("5x5")
            XCTAssertEqual(gridSize, CGSize(width: 5, height: 5))
        } catch let error {
            XCTFail(error.localizedDescription)
        }
    }
    
    func testParsePoints() throws {
        do {
            let pizzabot = Pizzabot()
            let points = try pizzabot.parseDeliveryPoints("(1, 3) (4,4)")
            XCTAssertEqual(points, [Point(x: 1, y: 3), Point(x: 4, y: 4)])
        } catch let error {
            XCTFail(error.localizedDescription)
        }
    }
    
    func testPizzabot() throws {
        do {
            let pizzabot = Pizzabot()
            let routeInstructions = try pizzabot.getRouteInstructions("5x5 (1, 3) (4, 4)")
            XCTAssertEqual(routeInstructions, "ENNNDEEEND")
        } catch let error {
            XCTFail(error.localizedDescription)
        }
    }
    
    func testEastMovements() throws {
        let pizzabot = Pizzabot()
        let steps = 3
        let movements = pizzabot.makeHorizontallMovements(steps: steps)
        XCTAssertEqual(movements, Array(repeating: .moveEast, count: steps))
    }
    
    func testWestMovements() throws {
        let pizzabot = Pizzabot()
        let steps = -3
        let movements = pizzabot.makeHorizontallMovements(steps: steps)
        XCTAssertEqual(movements, Array(repeating: .moveWest, count: abs(steps)))
    }
    
    func testNorthMovements() throws {
        let pizzabot = Pizzabot()
        let steps = 3
        let movements = pizzabot.makeVerticalMovements(steps: steps)
        XCTAssertEqual(movements, Array(repeating: .moveNorth, count: steps))
    }
    
    func testSouthMovements() throws {
        let pizzabot = Pizzabot()
        let steps = -3
        let movements = pizzabot.makeVerticalMovements(steps: steps)
        XCTAssertEqual(movements, Array(repeating: .moveSouth, count: abs(steps)))
    }
}
