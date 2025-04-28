//
//  ListCoinsDataProvider.swift
//  MarketCoins
//
//  Created by Juliano Sgarbossa on 28/04/25.
//

import Foundation

protocol ListCoinsDataProviderDelegate: GenericDataProviderDelegate {
    
}

class ListCoinsDataProvider: DataProviderManager<ListCoinsDataProviderDelegate, [CoinModel]> {
    
    private let coinsStore: CoinsStoreProtocol?
    
    init(coinsStore: CoinsStoreProtocol = CoinsStore()) {
        self.coinsStore = coinsStore
    }
    
    func fetchListCoins(by vsCurency: String,
                        with cryptocurrency: [String]?,
                        orderBy order: String,
                        total parPage: Int,
                        page: Int,
                        percentagePrice: String) {
        
        coinsStore?.fetchListCoins(by: vsCurency,
                                   with: cryptocurrency,
                                   orderBy: order,
                                   total: parPage,
                                   page: page,
                                   percentagePrice: percentagePrice,
                                   completion: { result, error in
            if let error {
                self.delegate?.errorData(self.delegate, error: error)
            }
            
            if let result {
                self.delegate?.sucess(model: result)
            }
        })
    }
}
