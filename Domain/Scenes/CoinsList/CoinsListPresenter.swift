//
//  CoinsListPresenter.swift
//  MarketCoins
//
//  Created by Juliano Sgarbossa on 28/04/25.
//  Copyright (c) 2025 ___ORGANIZATIONNAME___. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

protocol CoinsListPresentationLogic {
    func presentGlobalValues(response: CoinsList.FetchGlobalValues.Response)
    func presentErrorForGlobalValues(baseCoin: CoinsFilterEnum)
    func presentListCoins(response: [CoinsList.FetchListCoins.Response])
    func presentError(error: CryptocurrenciesError)
}

class CoinsListPresenter: CoinsListPresentationLogic {
    
    weak var viewController: CoinsListDisplayLogic?
    
    func presentGlobalValues(response: CoinsList.FetchGlobalValues.Response) {
        var globalValues: [CoinsList.FetchGlobalValues.ViewModel.GlobalValues] = []
        
        for (_, value) in response.totalMarketCap {
            globalValues.append(CoinsList.FetchGlobalValues.ViewModel.GlobalValues(title: "Capitalização de Mercado Global",
                                                                                   value: value.toCurrency(coin: response.baseCoin)))
        }
        
        for (_, value) in response.totalVolume {
            globalValues.append(CoinsList.FetchGlobalValues.ViewModel.GlobalValues(title: "Volume em 24hs",
                                                                                   value: value.toCurrency(coin: response.baseCoin)))
        }
        
        let viewModel = CoinsList.FetchGlobalValues.ViewModel(globalValues: globalValues)
        
        viewController?.displayGlobalValues(viewModel: viewModel)
    }
    
    func presentErrorForGlobalValues(baseCoin: CoinsFilterEnum) {
        let  globalValues: [CoinsList.FetchGlobalValues.ViewModel.GlobalValues] = [
            CoinsList.FetchGlobalValues.ViewModel.GlobalValues(title: "Capitalização de Mercado Global",
                                                               value: 0.0.toCurrency(coin: baseCoin)),
            
            CoinsList.FetchGlobalValues.ViewModel.GlobalValues(title: "Volume em 24hs",
                                                               value: 0.0.toCurrency(coin: baseCoin))
            
        ]
        
        let viewModel = CoinsList.FetchGlobalValues.ViewModel(globalValues: globalValues)
        
        viewController?.displayGlobalValues(viewModel: viewModel)
    }
    
    func presentListCoins(response: [CoinsList.FetchListCoins.Response]) {
        let coins = response.map { response in
            var rank = "-"
            
            if let marketCapRank = response.marketCapRank {
                rank = "\(marketCapRank)"
            }
            return CoinsList.FetchListCoins.ViewModel.Coin(id: response.id,
                                                           name: response.name,
                                                           rank: rank,
                                                           iconUrl: response.image,
                                                           symbol: response.symbol.uppercased(),
                                                           price: response.currentPrice.toCurrency(coin: response.baseCoin),
                                                           priceChangePercentage: response.priceChangePercentage.toPercentage(),
                                                           marketCapitalization: response.marketCap.toCurrency(coin: response.baseCoin))
        }
        
        let viewModel = CoinsList.FetchListCoins.ViewModel(coins: coins)
        
        viewController?.displayListCoins(viewModel: viewModel)
    }
    
    func presentError(error: CryptocurrenciesError) {
        viewController?.displayError(error: error.errorDescription)
    }
}
