//
//  CoinHeaderView.swift
//  MarketCoins
//
//  Created by Juliano Sgarbossa on 01/05/25.
//

import UIKit

class CoinHeaderView: UITableViewHeaderFooterView {
    
    static let identifier = "CoinHeaderView"
    
    @IBOutlet weak var priceChangePercentageLabel: UILabel!
    
    func setupPriceChangePercengate(filter: Filter) {
        if filter.type == .priceChangePercentage {
            if let priceChangePercentageFilter = PriceChangePercentageFilerEnum(rawValue: filter.key) {
                priceChangePercentageLabel.text = priceChangePercentageFilter.title
            }
        }
    }
}
