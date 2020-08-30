//
//  AccountViews.swift
//  TheBank
//
//  Created by Alessio Roberto on 10/07/2020.
//

import SwiftUI

struct AccountView: View {
    let data: Account

    var body: some View {
        ZStack {
            ContainerRelativeShape()
                .fill(Color("AccentColor"))
            VStack(alignment: .leading) {
                HStack {
                    data.image
                        .font(.body)
                        .foregroundColor(/*@START_MENU_TOKEN@*/ .white/*@END_MENU_TOKEN@*/)
                    Text(data.name)
                        .font(.body)
                        .fontWeight(.bold)
                        .padding(.trailing, 10)
                        .foregroundColor(/*@START_MENU_TOKEN@*/ .white/*@END_MENU_TOKEN@*/)
                        .minimumScaleFactor(0.8)
                }
                Spacer()
                Text("\(data.amount, specifier: "%.2f") \(data.currency)")
                    .font(.body)
                    .foregroundColor(/*@START_MENU_TOKEN@*/ .white/*@END_MENU_TOKEN@*/)
                Spacer()
            }
            .padding([.top, .bottom, .trailing])
        }
    }
}

struct AccountViewLarge: View {
    let data: Account

    var body: some View {
        ZStack {
            ContainerRelativeShape()
                .fill(Color("AccentColor"))
            HStack {
                Spacer()
                HStack {
                    data.image
                        .font(.body)
                        .foregroundColor(/*@START_MENU_TOKEN@*/ .white/*@END_MENU_TOKEN@*/)

                    Text(data.name)
                        .font(.body)
                        .fontWeight(.bold)
                        .padding(.trailing, 10)
                        .foregroundColor(/*@START_MENU_TOKEN@*/ .white/*@END_MENU_TOKEN@*/)
                        .minimumScaleFactor(0.8)
                }
                .padding(.all)
                Spacer()
                Text("\(data.amount, specifier: "%.2f") \(data.currency)")
                    .font(.body)
                    .foregroundColor(/*@START_MENU_TOKEN@*/ .white/*@END_MENU_TOKEN@*/)
                Spacer()
            }
            .padding([.top, .bottom, .trailing])
        }
    }
}

struct Title: View {
    private let account = "Account"
    private let accounts = "Accounts"
    @Environment(\.widgetFamily) private var widgetFamily

    var body: some View {
        Text(widgetFamily == .systemSmall ? account : accounts)
            .font(.largeTitle)
            .foregroundColor(Color("AccentColor"))
            .minimumScaleFactor(0.8)
            .padding(.trailing)
    }
}

struct AccountViews_Previews: PreviewProvider {
    static var previews: some View {
        /*@START_MENU_TOKEN@*/Text("Hello, World!")/*@END_MENU_TOKEN@*/
    }
}
