//
//  OHLCDataProvider.swift
//  MarketCoins
//
//  Created by Juliano Sgarbossa on 14/05/25.
//

import Foundation

protocol OHLCDataProviderDelegate: GenericDataProviderDelegate {
    
}

class OHLCDataProvider: DataProviderManager<OHLCDataProviderDelegate, [GraphicDataModel]> {
    
    private let coinStore: CoinsStoreProtocol?
    
    init(coinStore: CoinsStoreProtocol = CoinsStore()) {
        self.coinStore = coinStore
    }
    
    func fetchOhlc(id: String, currency: String, of: String) {
        coinStore?.fetchHistorical(by: id, currency: currency, of: of, completion: { result, error in
            if let error {
                self.delegate?.errorData(self.delegate, error: error)
            }
            
            if let result {
                self.delegate?.sucess(model: result)
            }
        })
    }
}
