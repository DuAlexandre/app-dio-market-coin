//
//  GlobalModel.swift
//  MarketCoins
//
//  Created by Eduardo Alexandre on 12/02/23.
//

import Foundation

struct GlobalModel: Codable {
    let data: CryptoCurrencyModel
}

struct CryptoCurrencyModel: Codable {
    let activeCryptoCurrencies: Int //criptomoedas ativas
    let upcomingIcos: Int //proximos icos
    let onGoingIcos: Int //icos em andamento
    let endedIcos: Int //terminou icos
    let markets: Int //mercados
    let totalMarketCap: [String:Double] //valor total de mercado por moeda
    let totalVolume: [String:Double] //valor total por moeda
    let marketCapPercentage: [String:Double] //porcentagem de capitalização de mercado por moeda
    let marketCapChangePercentage24HUsd: Double //porcentagem de alteração do valor de mercado em 24h em dolar
    let updatedAt: Int //data de atualização em timestamps
    
    enum CodingKeys: String, CodingKey {
        case activeCryptoCurrencies = "active_cryptocurrencies"
        case upcomingIcos = "upcoming_icos"
        case onGoingIcos = "ongoing_icos"
        case endedIcos = "ended_icos"
        case markets
        case totalMarketCap = "total_market_cap"
        case totalVolume = "total_volume"
        case marketCapPercentage = "market_cap_percentage"
        case marketCapChangePercentage24HUsd = "market_cap_change_percentage_24h_usd"
        case updatedAt = "updated_at"
    }
}
