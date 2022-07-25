//
//  Mockable.swift
//  SpotOnTests
//
//  Created by Murali Gorantla (TCIN) on 25/07/22.
//

import Foundation
@testable import SpotOn

protocol Mockable: AnyObject {
    var bundle: Bundle { get }
    func loadJSON<T: Decodable>(filename: String, result: @escaping (Result<T, ServerError>) -> Void)
}

extension Mockable {
    
    var bundle: Bundle {
        return Bundle(for: type(of: self))
    }
    
    func loadJSON<T: Decodable>(filename: String, result: @escaping (Result<T, ServerError>) -> Void) {
        guard let path = bundle.url(forResource: filename, withExtension: "json") else {
            result(.failure(ServerError.invalidData))
            return
        }
        do {
            let data = try Data(contentsOf: path)
            let decodedObject = try JSONDecoder().decode(T.self, from: data)
            result(.success(decodedObject))
        } catch {
            result(.failure(ServerError.invalidData))
        }
    }
}
