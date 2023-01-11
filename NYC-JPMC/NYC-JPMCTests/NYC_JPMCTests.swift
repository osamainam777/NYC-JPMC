//
//  NYC_JPMCTests.swift
//  NYC-JPMCTests
//
//  Created by Usama Inaam Rasheed on 1/11/23.
//

import XCTest
import SwiftUI
@testable import NYC_JPMC

final class NYC_JPMCTests: XCTestCase {
    
    @ObservedObject var viewModel: SchoolViewModel = SchoolViewModel()

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    func testFetchSchool() {
        let expectation = XCTestExpectation(description: "Must return true")
        let viewModel = viewModel
        viewModel.getData { success in
            if success {
                expectation.fulfill()
                
            } else {
                XCTFail("Couldn't get data")
            }
        }
    }
    
    func testGetScore() {
        let expectation = XCTestExpectation(description: "Must return true")
        let viewModel = viewModel

        viewModel.getSatData(with: "21K728") { success in
            if success {
                expectation.fulfill()
                
            } else {
                XCTFail("Couldn't get data")
            }
        }
    }
}
