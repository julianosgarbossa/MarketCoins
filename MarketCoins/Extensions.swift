//
//  Extensions.swift
//  MarketCoins
//
//  Created by Juliano Sgarbossa on 28/04/25.
//

import Foundation
import UIKit

extension URL {
    var queryParameters: [String: String]? {
        guard let components = URLComponents(url: self, resolvingAgainstBaseURL: false), let queryItems = components.queryItems else { return nil }
        
        var items: [String: String] = [:]
        
        for queryItem in queryItems {
            items[queryItem.name] = queryItem.value
        }
        
        return items
    }
    
    func appendingQueryParameters(path: String, parameters: [String : String]? = nil) -> URL? {
        guard var urlComponents = URLComponents(url: self, resolvingAgainstBaseURL: true) else { return nil }
        
        guard let parameters else {
            guard let url = urlComponents.url else { return nil }
            return url.appendingPathComponent(path)
        }
        
        urlComponents.queryItems = (urlComponents.queryItems ?? []) + parameters.map { URLQueryItem(name: $0, value: $1) }
        guard let url = urlComponents.url else { return nil }
        return url.appendingPathComponent(path)
    }
}

extension Error {
    var errorCode: Int? {
        return (self as NSError).code
    }
}

extension Double {
    func toCurrency(coin: CoinsFilterEnum) -> String {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .currency
        numberFormatter.locale = Locale(identifier: coin.locale)
        
        guard let value = numberFormatter.string(from: NSNumber(value: self)) else {
            return String(self)
        }
        
        return value
    }
    
    func toPercentage() -> String {
        let value = String(format: "%1.f", self).replacingOccurrences(of: "-", with: "")
        
        if self.sign == .minus {
            return "\u{2193} \(value)%"
        } else {
            return "\u{2191} \(value)%"
        }
    }
}

extension UIImageView {
    func loadImage(url: String) {
        guard let url = URL(string: url) else { return }
        DispatchQueue.global().async {
            do {
                let data = try Data(contentsOf: url)
                DispatchQueue.main.async {
                    self.image = UIImage(data: data)
                }
            } catch {
                
            }
        }
    }
}

extension UIView {
    func addSubviews(subviews: UIView...) {
        subviews.forEach(addSubview)
    }
}
