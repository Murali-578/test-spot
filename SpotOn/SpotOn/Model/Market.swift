//
//  Market.swift
//  SpotOn
//
//  Created by Murali Gorantla (TCIN) on 24/07/22.
//

import Foundation

struct Market {
    let marketId: String
    let name: String
    let percentage: String
    let price: String
    
    private enum CodingKeys: String, CodingKey {
        case marketId = "id"
        case name
        case percentage = "changePercent24Hr"
        case price = "priceUsd"
    }
}

extension Market: Decodable {
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.marketId = try container.decode(String.self, forKey: .marketId)
        self.name = try container.decode(String.self, forKey: .name)
        self.percentage = try container.decode(String.self, forKey: .percentage)
        self.price = try container.decode(String.self, forKey: .price)
    }
}


extension Market: MarketItemInterface {
    var id: String {
        marketId
    }
    
    var marketName: String {
        name
    }
    
    var marketPercentage: String {
        percentage
    }
    
    var marketPrice: String {
        price
    }
    
}


struct MarketResponse: Decodable {
    var data: [Market]
}
