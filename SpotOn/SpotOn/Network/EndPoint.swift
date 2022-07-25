//
//  EndPoint.swift
//  SpotOn
//
//  Created by Murali Gorantla (TCIN) on 24/07/22.
//

import Foundation

protocol Endpoint {
    
    var base: String { get }
    var path: String { get }
    var subPath: String { get }
    var queryItems: [URLQueryItem] { get }
}

extension Endpoint {
    
    var urlComponents: URLComponents {
        var components = URLComponents(string: base)!
        components.path = subPath
        components.queryItems = queryItems
        return components
    }
    
    var request: URLRequest {
        let url = urlComponents.url!
        return URLRequest(url: url)
    }
}


enum SpotOnMethod {
    case getAllMarkets(String, String)
}

extension SpotOnMethod: Endpoint {
    
    var queryItems: [URLQueryItem] {
        switch self {
        case .getAllMarkets(let limit, let offset):
            return [
                URLQueryItem(name: "limit", value: limit),
                URLQueryItem(name: "offset", value: offset)
            ]
        }
    }
    
    var base: String {
        return "https://api.coincap.io"
    }
    
    var path: String {
        return "/v2"
    }
    
    var subPath: String {
        switch self {
        case .getAllMarkets:
            return "\(path)/assets"
        }
    }
    
}
