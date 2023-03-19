//
//  CryptoViewModel.swift
//  CryptoApp
//
//  Created by Andrew  on 3/19/23.
//

import Foundation

struct CryptoListViewModel {
    
    let cryptoCurrencyList : [CryptoCurrency]
    
}

extension CryptoListViewModel {
    func numberOfRowsInSection() -> Int {
        return self.cryptoCurrencyList.count
    }
    
    func cryptoAtIndex(_ index : Int) -> CryptoViewModel {
        let crypto = self.cryptoCurrencyList[index]
        return CryptoViewModel(cryptoCurrency: crypto)
    }
}

struct CryptoViewModel {
    let cryptoCurrency : CryptoCurrency    
}

extension CryptoViewModel {
    var name : String {
        return cryptoCurrency.currency
    }
    
    var price: String {
        return cryptoCurrency.price
    }
}
