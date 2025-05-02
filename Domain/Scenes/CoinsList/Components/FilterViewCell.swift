//
//  FilterViewCell.swift
//  MarketCoins
//
//  Created by Juliano Sgarbossa on 01/05/25.
//

import UIKit

class FilterViewCell: UICollectionViewCell {
    
    static let identifier = "FilterViewCell"
 
    @IBOutlet weak var filterLabel: UILabel!
    
    func setupCell(filter: Filter) {
        switch filter.type {
        case .coins:
            if let coinsFilter = CoinsFilterEnum(rawValue: filter.key) {
                filterLabel.text = coinsFilter.symbol
            }
        case .top:
            if let key = Int(filter.key), let topFilter = TopFilterEnum(rawValue: key) {
                filterLabel.text = topFilter.title
            }
        case .priceChangePercentage:
            if let priceChangePercentage = PriceChangePercentageFilerEnum(rawValue: filter.key) {
                filterLabel.text = priceChangePercentage.title
            }
        case .orderBy:
            if let orderByFilter = OrderByFilterEnum(rawValue: filter.key) {
                filterLabel.text = "Ordenado Por \(orderByFilter.title) \(orderByFilter.order)"
            }
        }
    }
}
