//
//  User.swift
//  TheBank
//
//  Created by Alessio Roberto on 27/06/2020.
//

import Foundation

struct User: Identifiable {
    let id = UUID().uuidString
    let name: String
}

let stubUsers = [User(name: "Alessio"), User(name: "Theo")]
