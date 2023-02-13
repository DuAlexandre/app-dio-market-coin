//
//  ViewController.swift
//  MarketCoins
//
//  Created by Eduardo Alexandre on 12/02/23.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let dataProvider = ListCoinDataProvider()
        dataProvider.delegate = self
        dataProvider.fetchListCoins(by: "brl",
                                    with: [nil],
                                    orderBy: "market_cap_desc",
                                    total: 10,
                                    page: 1,
                                    percentagePrice: "1h")
    }
}

extension ViewController: ListCoinDataProviderDelegate {
    
    func success(model: Any) {
        let coinList = model as? [CoinModel]
        print(coinList ?? "Vazio")
    }
    
    func errorData(_ provider: GenericDataProviderDelegate?, error: Error) {
        print(error.localizedDescription)
    }
}

