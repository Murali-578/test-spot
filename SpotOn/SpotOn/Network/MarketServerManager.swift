//
//  MarketServerManager.swift
//  SpotOn
//
//  Created by Murali Gorantla (TCIN) on 24/07/22.
//

import Foundation

protocol MarketServiceable {
    func requestMarketData(pageLimit: String, offset: String, completion: @escaping (Result<MarketResponse, ServerError>) -> Void)
}

class MarketServerManager: ServerManager {
    
    func requestMarketData(pageLimit: String, offset: String, completion: @escaping (Result<MarketResponse, ServerError>) -> Void) {
        let endpoint = SpotOnMethod.getAllMarkets(pageLimit, offset)
        let request = endpoint.request
        performRequest(with: request, completionHandler: completion)
    }
}
