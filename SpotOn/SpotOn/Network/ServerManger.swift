//
//  ServerManger.swift
//  SpotOn
//
//  Created by Murali Gorantla (TCIN) on 24/07/22.
//

import Foundation

enum ServerError: Error {
    case requestFailed
    case jsonConversionFailure
    case invalidData
    case responseUnsuccessful
    case jsonParsingFailure
    
    var localizedDescription: String {
        switch self {
        case .requestFailed: return "Request Failed"
        case .invalidData: return "Invalid Data"
        case .responseUnsuccessful: return "Response Unsuccessful"
        case .jsonParsingFailure: return "JSON Parsing Failure"
        case .jsonConversionFailure: return "JSON Conversion Failure"
        }
    }
}

protocol ServerManager {
    func performRequest<T: Decodable>(with request: URLRequest, completionHandler completion: @escaping (Result<T, ServerError>) -> Void)
}

extension ServerManager {
    
    func performRequest<T: Decodable>(with request: URLRequest, completionHandler completion: @escaping (Result<T, ServerError>) -> Void) {
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in

            guard let httpResponse = response as? HTTPURLResponse else {
                completion(.failure(.requestFailed))
                return
            }
            if httpResponse.statusCode == 200 {
                if let data = data {
                    do {
                        let genericModel = try JSONDecoder().decode(T.self, from: data)
                        completion(.success(genericModel))
                    } catch {
                        completion(.failure(.jsonConversionFailure))
                    }
                } else {
                    completion(.failure(.invalidData))
                }
            } else {
                completion(.failure(.responseUnsuccessful))
            }
        }
        task.resume()
    }
}
