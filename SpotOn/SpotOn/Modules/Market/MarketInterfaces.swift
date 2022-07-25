//
//  MarketInterfaces.swift
//  SpotOn
//
//  Created by Murali Gorantla (TCIN) on 24/07/22.
//

import Foundation
import UIKit

protocol MarketWireframeInterface: WireframeInterface {
    func navigateToMarketDetails(id: String)
}

protocol MarketViewInterface: ViewInterface {
    func reloadData()
}

protocol MarketPresenterInterface: PresenterInterface {
    var numberOfItems: Int { get }
    func item(at indexPath: IndexPath) -> MarketItemInterface
    func itemSelected(at indexPath: IndexPath)
    func loadMarkets()
    func startRefresh()
    func stopRefresh()
}

protocol MarketInteractorInterface: InteractorInterface {
    func requestMarketData(pageSize: String, offset: String, completion: @escaping ((Result<MarketResponse, ServerError>) -> Void))
}


protocol MarketItemInterface {
    var `id`: String { get }
    var marketName: String { get }
    var marketPercentage: String { get }
    var marketPrice: String { get }
}
