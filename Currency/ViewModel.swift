//
//  ViewModel.swift
//  Currency
//
//  Created by Armando Maldonado Romo on 28/08/24.
//

import Foundation
import Combine

class CurrencyListViewModel : ObservableObject{
    @Published var currencies: [Currency] = []
    private let url = URL(string: "https://waseemtabrez.github.io/CurrencyTest/CurrencyList.json")!
    private var cancellable: AnyCancellable?

    init() {
        fetchCurrencies()
    }

    func fetchCurrencies() {
        cancellable = URLSession.shared.dataTaskPublisher(for: url)
            .map(\.data)
            .decode(type: [Currency].self, decoder: JSONDecoder())
            .sink(receiveCompletion: { completion in
                if case .failure(let error) = completion {
                    print("Error fetching currencies: \(error.localizedDescription)")
                }
            }, receiveValue: { [weak self] currencies in
                self?.currencies = currencies
            })
    }
}
