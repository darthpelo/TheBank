//
//  TheBankApp.swift
//  TheBank
//
//  Created by Alessio Roberto on 26/06/2020.
//

import SwiftUI

@main
struct TheBankApp: App {
    @State var deeplink: DeepLinker.DeepLink?

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.deeplink, deeplink)
                .onOpenURL { url in
                    let deeplinker = DeepLinker()
                    guard let deeplink = deeplinker.manage(url: url) else { return }
                    self.deeplink = deeplink
                    DispatchQueue.main.asyncAfter(deadline: .now() + .milliseconds(200)) {
                        self.deeplink = nil
                    }
                }
        }
    }
}
