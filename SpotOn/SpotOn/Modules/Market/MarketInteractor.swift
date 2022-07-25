//
//  MarketInteractor.swift
//  SpotOn
//
//  Created by Murali Gorantla (TCIN) on 24/07/22.
//

import Foundation

final class MarketInteractor {
    
    private let networkClient: MarketServerManager
    
    init(marketService: MarketServerManager) {
        self.networkClient = marketService
    }
}

// MARK: - Extensions -

extension MarketInteractor: MarketInteractorInterface {
    func requestMarketData(pageSize: String, offset: String, completion: @escaping ((Result<MarketResponse, ServerError>) -> Void)) {
        networkClient.requestMarketData(pageLimit: pageSize, offset: offset, completion: completion)
    }
}
