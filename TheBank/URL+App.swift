//
//  URL+App.swift
//  TheBank
//
//  Created by Alessio Roberto on 21/08/2020.
//

import Foundation

extension URL {
    static let appScheme = "thebank"
    static let appHost = "thebank.widget."
    static let appHomeUrl = "\(Self.appScheme)://\(Self.appHost)"
    static let appPersonalPath = "personal"
    static let appFamilyPath = "family"
}
