//
//  MarketPresenterMock.swift
//  SpotOnTests
//
//  Created by Murali Gorantla (TCIN) on 25/07/22.
//

import XCTest
@testable import SpotOn

class MarketPresenterMock: XCTestCase {
    
    var presenter: MarketPresenter!
    var view = MarketMockView()
    var interactor = MarketInteractorMock()
    var wireframe = MarketWireframeMock()

    override func setUpWithError() throws {
        presenter = MarketPresenter(view: view, interactor: interactor, wireframe: wireframe)
        presenter.loadMarkets()
    }

    override func tearDownWithError() throws {
        presenter = nil
    }

    func testPresenterData() throws {
        let indexPath = IndexPath(row: 5, section: 0)
        let itemAtIndex = presenter.item(at: indexPath)
        let firstMarketValue: MarketItemInterface = Market(marketId: "binance-usd", name: "Binance USD", percentage: "-0.0555787803214256", price: "1.0001814697971834")
        XCTAssertTrue(presenter.numberOfItems != 0)
        XCTAssertEqual(itemAtIndex.marketName, firstMarketValue.marketName)
    }
    
    func testWireFrameNavigation() throws {
        wireframe.navigateToMarketDetails(id: "binance-usd")
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}

class MarketMockView: MarketViewInterface {
    func reloadData() {
    }
}

class MarketWireframeMock: MarketWireframeInterface {
    
    func navigateToMarketDetails(id: String) {
        XCTAssertNotNil(id)
    }
    
    func showAlert(with title: String?, message: String?) {
        
    }
    
}
