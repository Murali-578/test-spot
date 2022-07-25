//
//  MarketInteractorMock.swift
//  SpotOnTests
//
//  Created by Murali Gorantla (TCIN) on 25/07/22.
//

import XCTest

@testable import SpotOn

class MarketInteractorMock: XCTestCase {
    
    private let networkClient = MarketServermanagerMock()
    
//    init(marketService: MarketServermanagerMock) {
//        self.networkClient = marketService
//        super.init()
//    }

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testMarketInteractorAPICall() throws {
        let firstMarketValue: MarketItemInterface = Market(marketId: "bitcoin", name: "Bitcoin", percentage: "3.9760584721664797", price: "23639.7925649549401867")
        let expectation = expectation(description: "CheckInteractorMockData")
        requestMarketData(pageSize: "", offset: "") { result in
            expectation.fulfill()
            switch result {
            case .success(let response):
                XCTAssertEqual(response.data.first?.marketId, firstMarketValue.id)
                XCTAssertEqual(response.data.first?.name, firstMarketValue.marketName)
            case .failure(let error):
                XCTAssertNil(error)
            }
        }
        wait(for: [expectation], timeout: 1.0)
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}

extension MarketInteractorMock: MarketInteractorInterface {
    func requestMarketData(pageSize: String, offset: String, completion: @escaping ((Result<MarketResponse, ServerError>) -> Void)) {
        networkClient.requestMockMarketData(pageLimit: pageSize, offset: offset, completion: completion)
    }
}
