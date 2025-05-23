//
//  MarketChartDataProvider.swift
//  MarketCoins
//
//  Created by Juliano Sgarbossa on 14/05/25.
//

import Foundation

protocol MarketChartDataProviderDelegate: GenericDataProviderDelegate {
    
}

class MarketChartDataProvider: DataProviderManager<MarketChartDataProviderDelegate, MarketDataModel> {
    
    private let coinStore: CoinsStoreProtocol?
    
    init(coinStore: CoinsStoreProtocol = CoinsStore()) {
        self.coinStore = coinStore
    }
    
    func fetchMarketChartRange(id: String, currency: String, from: String, to: String) {
        coinStore?.fetchHistorical(by: id, currency: currency, from: from, to: to, completion: { result, error in
            if let error {
                self.delegate?.errorData(self.delegate, error: error)
            }
            
            if let result {
                self.delegate?.sucess(model: result)
            }
        })
    }
}
