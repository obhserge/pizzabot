//
//  ParserTest.swift
//  Pizzabot
//
//  Created by Siarhei Krumin on 20.09.21.
//

import XCTest

@testable import Pizzabot

class ParserTest: XCTestCase {

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
}
