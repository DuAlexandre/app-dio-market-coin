//
//  CoinModel.swift
//  MarketCoins
//
//  Created by Eduardo Alexandre on 12/02/23.
//

import Foundation

struct CoinModel: Codable {
    let id, symbol, name: String
    let image: String
    let currentPrice: Double?
    let marketCap: Double?
    let marketCapRank: Int?
    let fullyDilutedValuation: Double?
    let totalVolume: Double?
    let high24H: Double?
    let low24H: Double?
    let priceChange24H, priceChangePercentage24H, marketCapChange24H, marketCapChangePercentage24H: Double?
    let circulatingSupply: Double
    let totalSupply, maxSupply: Double?
    let ath: Double
    let athChangePercentage: Double
    let athDate: String
    let atl, atlChangePercentage: Double
    let atlDate: String
    let lastUpdated: String
    let priceChangePercentage1H: Double? //percentual 1h
    let priceChangePercentage7D: Double? //percentual 7d
    let priceChangePercentage30D: Double? //percentual 30d

    enum CodingKeys: String, CodingKey {
        case id, symbol, name, image
        case currentPrice = "current_price"
        case marketCap = "market_cap"
        case marketCapRank = "market_cap_rank"
        case fullyDilutedValuation = "fully_diluted_valuation"
        case totalVolume = "total_volume"
        case high24H = "high_24h"
        case low24H = "low_24h"
        case priceChange24H = "price_change_24h"
        case priceChangePercentage24H = "price_change_percentage_24h"
        case marketCapChange24H = "market_cap_change_24h"
        case marketCapChangePercentage24H = "market_cap_change_percentage_24h"
        case circulatingSupply = "circulating_supply"
        case totalSupply = "total_supply"
        case maxSupply = "max_supply"
        case ath
        case athChangePercentage = "ath_change_percentage"
        case athDate = "ath_date"
        case atl
        case atlChangePercentage = "atl_change_percentage"
        case atlDate = "atl_date"
        case lastUpdated = "last_updated"
        case priceChangePercentage1H = "price_change_percentage_1h_in_currency"
        case priceChangePercentage7D = "price_change_percentage_7d_in_currency"
        case priceChangePercentage30D = "price_change_percentage_30d_in_currency"
    }
}
