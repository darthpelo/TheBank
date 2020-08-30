//
//  TransferMoney.swift
//  TheBank
//
//  Created by Alessio Roberto on 22/07/2020.
//

import SwiftUI

struct TransferMoney: View {
    @Environment(\.presentationMode) var presentationMode
    @Environment(\.deeplink) var deeplink
    
    @State var amount: String = ""

    var user: User

    var body: some View {
        VStack {
            HStack {
                (Text("Chose how many money send to ") + Text(user.name).bold())
                    .font(.title2)
            }
            .padding()
            TextField("amount", text: $amount)
                .padding(.horizontal, 10.0)
                .background(Color.white)
                .frame(height: 44.0)
                .shadow(color: Color.gray.opacity(0.4),
                        radius: 3, x: 1, y: 2)
                .padding(/*@START_MENU_TOKEN@*/.horizontal/*@END_MENU_TOKEN@*/, 40)
                .keyboardType(/*@START_MENU_TOKEN@*/.decimalPad/*@END_MENU_TOKEN@*/)
            (Text(amount) + Text(Image(systemName: "bahtsign.circle")))
                .font(/*@START_MENU_TOKEN@*/.title3/*@END_MENU_TOKEN@*/)
                .padding()
            Button(action: sendMoney, label: {
                Text("Transfer")
                    .foregroundColor(.white)
                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
            })
            .frame(width: 200.0, height: 44.0)
            .cornerRadius(/*@START_MENU_TOKEN@*/5.0/*@END_MENU_TOKEN@*/)
            .background(Color.green)
            .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/, /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
            .shadow(color: Color.gray, radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
        }
        .onChange(of: deeplink, perform: { deeplink in
            guard let _ = deeplink else { return }
            presentationMode.wrappedValue.dismiss()
        })
    }

    internal func sendMoney() {
        print("send \(amount)")
    }
}

struct TransferMoney_Previews: PreviewProvider {
    static var previews: some View {
        TransferMoney(user: User(name: "Theo"))
    }
}
