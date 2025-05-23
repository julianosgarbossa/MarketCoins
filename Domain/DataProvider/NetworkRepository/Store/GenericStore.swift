//
//  GenericStore.swift
//  MarketCoins
//
//  Created by Juliano Sgarbossa on 28/04/25.
//

import Foundation

protocol GenericStoreProtocol {
    var error: Error { get set }
    typealias completion<T> = (_ result: T, _ failure: Error?) -> Void
}

class GenericStoreRequest: GenericStoreProtocol {
    var error = NSError(domain: "", code: 901, userInfo: [NSLocalizedDescriptionKey : "Error getting information"]) as Error
    
    func request<T: Codable>(url: URL, completion: @escaping completion<T?>) {
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data else {
                completion(nil, self.error)
                return
            }
            
            if let error {
                completion(nil, error)
                return
            }
            
            do {
                let object = try JSONDecoder().decode(T.self, from: data)
                completion(object, nil)
            } catch {
                completion(nil, error)
            }
        }
        task.resume()
    }
}
