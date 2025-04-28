//
//  GenericDataProvider.swift
//  MarketCoins
//
//  Created by Juliano Sgarbossa on 28/04/25.
//

import Foundation

protocol GenericDataProviderDelegate {
    func sucess(model: Any)
    func errorData(_ provider: GenericDataProviderDelegate?, error: Error)
}

class DataProviderManager<T, S> {
    var delegate: T?
    var model: S?
}
