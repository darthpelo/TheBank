//
//  DeepLinker.swift
//  TheBank
//
//  Created by Alessio Roberto on 20/08/2020.
//

import Foundation
import SwiftUI

final class DeepLinker {
    enum DeepLink: Equatable {
        case personalAccount
        case familyAccount
    }

    func manage(url: URL) -> DeepLink? {
        guard url.scheme == URL.appScheme else { return nil }
        guard let absoluteString = url.absoluteString.components(separatedBy: "/").last else { return nil }

        return absoluteString == URL.appHost+URL.appPersonalPath ? .personalAccount : .familyAccount
    }
}

struct DeeplinkKey: EnvironmentKey {
    static var defaultValue: DeepLinker.DeepLink? {
        return nil
    }
}

extension EnvironmentValues {
    var deeplink: DeepLinker.DeepLink? {
        get {
            self[DeeplinkKey]
        }
        set {
            self[DeeplinkKey] = newValue
        }
    }
}
