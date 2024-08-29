//
//  ContentView.swift
//  Currency
//
//  Created by Armando Maldonado Romo on 27/08/24.
//

import SwiftUI
import Combine




struct ContentView: View {
    @StateObject var viewModel = CurrencyListViewModel()

    var body: some View {
        List(viewModel.currencies, id: \.id) { currency in
            HStack {
                Image(uiImage: UIImage(named: currency.flag)!)
                    .resizable()
                    .frame(width: 24, height: 24)
                Text(currency.name)
            }
        }
        .onAppear {
            viewModel.fetchCurrencies()
        }
    }
}

