//
//  CoinsListInteractor.swift
//  MarketCoins
//
//  Created by Eduardo Alexandre on 13/02/23.
//  Copyright (c) 2023 ___ORGANIZATIONNAME___. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

protocol CoinsListBusinessLogic {
    
    func doFetchGlobalValues(request: CoinsList.FetchGlobalValues.Request)
    func doFetchListCoins(request: CoinsList.FetchListCoins.Request)
}

protocol CoinsListDataStore {
  //var name: String { get set }
}

class CoinsListInteractor: CoinsListBusinessLogic, CoinsListDataStore {
  
    var presenter: CoinsListPresentationLogic?
    var globalValuesWorker: GlobalValuesWorker?
    var coinsListWorker: CoinsListWorker?
  
    init(presenter: CoinsListPresentationLogic = CoinsListPresenter(),
         globalValuesWorker: GlobalValuesWorker = GlobalValuesWorker(),
         coinsListWorker: CoinsListWorker? = CoinsListWorker()) {
        
        self.presenter = presenter
        self.globalValuesWorker = globalValuesWorker
        self.coinsListWorker = coinsListWorker
    }
    
    func doFetchGlobalValues(request: CoinsList.FetchGlobalValues.Request) {
        globalValuesWorker?.doFetchGlobalValues(completion: { result in
            switch result {
            case .success(let globalModel):
                self.createGlobalValuesResponse(baseCoin: request.baseCoin, globalModel: globalModel)
            case .failure(let error):
            }
        })
    }
    
    func doFetchListCoins(request: CoinsList.FetchListCoins.Request) {
        let baseCoin = request.baseCoin
        let orderBy = request.orderBy
        let top = request.top
        let percentagePrice = request.pricePorcentage
        
        coinsListWorker?.doFetchListCoins(baseCoin: baseCoin,
                                          orderBy: orderBy,
                                          top: top,
                                          percentagePrice: percentagePrice,
                                          completion: { result in
            
            switch result {
            case .success(let listCoinsModel):
                self.createListCoinsResponse(request: request, listCoins: listCoinsModel)
            case .failure(let error):
            }
            
        })
    }
    
    private func createGlobalValuesResponse(baseCoin: String, global: GlobalModel?) {
        if let globalModel {
            let totalMarketCap = globalModel.data.totalMarketCap.filter { $0.key == baseCoin }
            let totalVolume = globalModel.data.totalVolume.filter { $0.key == baseCoin }
            
            let response = CoinsList.FetchGlobalValues.Response(baseCoin: baseCoin,
                                                                totalMarketCap: totalMarketCap,
                                                                totalVolume: totalVolume)
        } else {
            
        }
    }
    
    private func createListCoinsResponse(request: CoinsList.FetchListCoins.Request, listCoins: [CoinModel]?) {
        if let listCoins {
            func priceChangePercentage(pricePercentage: String, coin: CoinModel) -> Double {
                if pricePercentage == "1h" {
                    return coin.priceChangePercentage1H ?? 0.0
                } else if pricePercentage == "24h" {
                    return coin.priceChangePercentage24H ?? 0.0
                } else if pricePercentage == "7d" {
                    return coin.priceChangePercentage7D ?? 0.0
                } else {
                    return coin.priceChangePercentage30D ?? 0.0
                }
            }
            
            let response = listCoins.map { coin in
                return CoinsList.FetchListCoins.Response(baseCoin: request.baseCoin,
                                                         id: coin.id,
                                                         symbol: coin.symbol,
                                                         name: coin.name,
                                                         image: coin.image,
                                                         currentPrice: coin.currentPrice ?? 0.0,
                                                         marketCap: coin.marketCap ?? 0.0,
                                                         marketCapRank: coin.marketCapRank,
                                                         priceChangePercentage: priceChangePercentage(pricePercentage: request.pricePorcentage, coin: coin) )
                
            }
        } else {
            
        }
    }
  
}
