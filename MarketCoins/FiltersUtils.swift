//
//  FiltersUtils.swift
//  MarketCoins
//
//  Created by Juliano Sgarbossa on 01/05/25.
//

import Foundation

enum CoinsFilterEnum: String, CaseIterable {
    case brl = "brl"
    case usd = "usd"
    case eur = "eur"
    
    var name: String {
        switch self {
        case .brl:
            return "Real"
        case .usd:
            return "Dolar"
        case .eur:
            return "Euro"
        }
    }
    
    var symbol: String {
        switch self {
        case .brl:
            return "BRL"
        case .usd:
            return "USD"
        case .eur:
            return "EUR"
        }
    }
    
    var locale: String {
        switch self {
        case .brl:
            return "pt_BR"
        case .usd:
            return "en_US"
        case .eur:
            return "en_EU"
        }
    }
}

enum TopFilterEnum: Int, CaseIterable {
    case top10 = 10
    case top100 = 100
    case top500 = 500
    case top1000 = 1000
    
    var title: String {
        switch self {
        case .top10:
            return "Top 10"
        case .top100:
            return "Top 100"
        case .top500:
            return "Top 500"
        case .top1000:
            return "Top 1000"
        }
    }
}

enum PriceChangePercentageFilerEnum: String, CaseIterable {
    case lastHour = "1h"
    case oneDay = "24h"
    case oneWeek = "7d"
    case oneMonth = "30d"
    
    var title: String {
        switch self {
        case .lastHour:
            return "1 h"
        case .oneDay:
            return "24 hs"
        case .oneWeek:
            return "7 dias"
        case .oneMonth:
            return "1 mês"
        }
    }
}

enum OrderByFilterEnum: String, CaseIterable {
    case marketCapDesc = "market_cap_desc"
    case marketCapAsc = "market_cap_asc"
    case volumeDesc = "volume_desc"
    case volumeAsc = "volume_asc"
    
    var title: String {
        switch self {
        case .marketCapDesc, .marketCapAsc:
            return "Capitalização de Mercado"
        case .volumeDesc, .volumeAsc:
            return "Volume"
        }
    }
    
    var order: String {
        switch self {
        case .marketCapDesc, .volumeDesc:
            return "\u{2193}"
        case .marketCapAsc, .volumeAsc:
            return "\u{2191}"
        }
    }
}

enum FiltersTypeEnum {
    case coins
    case top
    case priceChangePercentage
    case orderBy
}

struct Filter {
    var type: FiltersTypeEnum
    var key: String
}

class FiltersUtils {
    
    public static let shared = FiltersUtils()
    
    private init() {
        
    }
    
    private var filters = [
        Filter(type: .coins, key: CoinsFilterEnum.brl.rawValue),
        Filter(type: .top, key: "\(TopFilterEnum.top10.rawValue)"),
        Filter(type: .priceChangePercentage, key: PriceChangePercentageFilerEnum.lastHour.rawValue),
        Filter(type: .orderBy, key: OrderByFilterEnum.marketCapDesc.rawValue),
    ]
    
    var displayedFilters: [Filter] {
        return filters
    }
    
    var count: Int {
        return filters.count
    }
    
    var coinsFilter: [Filter] {
        return CoinsFilterEnum.allCases.map { Filter(type: .coins, key: $0.rawValue) }
    }
    
    var topFilter: [Filter] {
        return TopFilterEnum.allCases.map { Filter(type: .top, key: "\($0.rawValue)") }
    }
    
    var priceChangePercentageFilter: [Filter] {
        return PriceChangePercentageFilerEnum.allCases.map { Filter(type: .priceChangePercentage, key: $0.rawValue) }
    }
    
    var orderByFilter: [Filter] {
        return OrderByFilterEnum.allCases.map { Filter(type: .orderBy, key: $0.rawValue) }
    }
    
    func setSelectedFilter(filter: Filter, index: Int) {
        filters[index] = filter
    }
    
    func getSelectedCoinsFilter() -> CoinsFilterEnum {
        if let filter = displayedFilters.filter({ $0.type == .coins }).first {
            return CoinsFilterEnum(rawValue: filter.key) ?? .brl
        }
        return .brl
    }
    
    func getSelectedTopFilter() -> TopFilterEnum {
        if let filter = displayedFilters.filter({ $0.type == .top }).first {
            return TopFilterEnum(rawValue: Int(filter.key) ?? 10) ?? .top10
        }
        return .top10
    }
    
    func getSelectedPriceChangePercentageFilter() -> PriceChangePercentageFilerEnum {
        if let filter = displayedFilters.filter({ $0.type == .priceChangePercentage }).first {
            return PriceChangePercentageFilerEnum(rawValue: filter.key) ?? .lastHour
        }
        return .lastHour
    }
    
    func getSelectedOrderByFilter() -> OrderByFilterEnum {
        if let filter = displayedFilters.filter({ $0.type == .orderBy }).first {
            return OrderByFilterEnum(rawValue: filter.key) ?? .marketCapDesc
        }
        return .marketCapDesc
    }
}
