//
//  CurrentDataDataProvider.swift
//  MarketCoins
//
//  Created by Juliano Sgarbossa on 14/05/25.
//

import Foundation

protocol CurrentDataDataProviderDelegate: GenericDataProviderDelegate {
    
}

class CurrentDataDataProvider: DataProviderManager<CurrentDataDataProviderDelegate, CurrentDataModel> {
    
    private let coinStore: CoinsStoreProtocol?
    
    init(coinStore: CoinsStoreProtocol = CoinsStore()) {
        self.coinStore = coinStore
    }
    
    func fetchCoin(id: String) {
        coinStore?.fetchCoin(by: id, completion: { result, error in
            if let error {
                self.delegate?.errorData(self.delegate, error: error)
            }
            
            if let result {
                self.delegate?.sucess(model: result)
            }
        })
    }
}
