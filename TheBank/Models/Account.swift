//
//  Account.swift
//  TheBank
//
//  Created by Alessio Roberto on 27/06/2020.
//

import SwiftUI

struct Account: Identifiable {
    let id = UUID().uuidString
    let name: String
    var amount: Double = 0.0
    var currency: String = "€"
    let image: Image
}

struct AccountService {
    func accounts() -> [Account] {
        stubList
    }

    func personal() -> Account {
        stubList.filter { $0.name == "Personal" }.first!
    }

    func family() -> Account? {
        stubList.filter { $0.name == "Family" }.first
    }
}

let stubList = [
    Account(name: "Personal",
            amount: 250.0,
            image: Image(systemName: "person")),
    Account(name: "Family",
            amount: 1025.0,
            image: Image(systemName: "person.3")),
]
