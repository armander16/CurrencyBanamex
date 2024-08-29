//
//  Modelo.swift
//  Currency
//
//  Created by Armando Maldonado Romo on 28/08/24.
//

import Foundation



struct Currency: Identifiable, Codable {
    let id = UUID()
    let name: String
    let flag: String
}

