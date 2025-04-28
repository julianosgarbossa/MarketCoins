//
//  ViewController.swift
//  MarketCoins
//
//  Created by Juliano Sgarbossa on 28/04/25.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let dataProvider = ListCoinsDataProvider()
        dataProvider.delegate = self
        dataProvider.fetchListCoins(by: "brl", with: nil, orderBy: "market_cap.desc", total: 10, page: 1, percentagePrice: "1h")
    }
}

extension ViewController: ListCoinsDataProviderDelegate {
    func sucess(model: Any) {
        let coinList = model as? [CoinModel]
        print(coinList ?? "Vazio")
    }
    
    func errorData(_ provider: (any GenericDataProviderDelegate)?, error: any Error) {
        print(error.localizedDescription)
    }
    
    
}

