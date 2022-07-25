//
//  ServerManagerMock.swift
//  SpotOnTests
//
//  Created by Murali Gorantla (TCIN) on 25/07/22.
//

import XCTest
@testable import SpotOn

class MarketServermanagerMock: XCTestCase  {
    
    private var marketData: [Market] = []

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
    
    func testToFetchMarketData() throws {
        let expectation = expectation(description: "Load Market Data")
        self.requestMockMarketData(pageLimit: Constants.pageSize, offset: Constants.offset) {[weak self] result in
            expectation.fulfill()
            guard let self = self else { return }
            switch result {
            case .success(let response):
                self.marketData = response.data
            case .failure(let error):
                XCTAssertNil(error)
            }
        }
        waitForExpectations(timeout: 3.0, handler: nil)
        XCTAssertEqual(self.marketData.count, 20)
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}

extension MarketServermanagerMock: Mockable {
    
    func requestMockMarketData(pageLimit: String, offset: String, completion: @escaping (Result<MarketResponse, ServerError>) -> Void) {
        loadJSON(filename: "market_data", result: completion)
    }
}
