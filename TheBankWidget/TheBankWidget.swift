//
//  TheBankWidget.swift
//  TheBankWidget
//
//  Created by Alessio Roberto on 28/06/2020.
//

import SwiftUI
import WidgetKit

@main
struct TheBankWidget: Widget {
    private let kind: String = "TheBankWidget"

    public var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind,
                            provider: Provider()) { entry in
            TheBankWidgetEntryView(entry: entry)
        }
        .configurationDisplayName("The Bank Account")
        .description("Monitoring your accounts")
    }
}

struct Provider: TimelineProvider {
    public typealias Entry = SimpleEntry

    public func snapshot(with _: Context, completion: @escaping (SimpleEntry) -> Void) {
        let entry = SimpleEntry(date: Date(),
                                accounts: AccountService().accounts(),
                                isLogged: AuthService.userIsLogged())
        completion(entry)
    }

    public func timeline(with _: Context, completion: @escaping (Timeline<Entry>) -> Void) {
        var entries: [SimpleEntry] = []

        // Generate a timeline consisting of five entries an hour apart, starting from the current date.
        let currentDate = Date()
        for hourOffset in 0 ..< 5 {
            let entryDate = Calendar.current.date(byAdding: .hour,
                                                  value: hourOffset,
                                                  to: currentDate)!
            let entry = SimpleEntry(date: entryDate,
                                    accounts: AccountService().accounts(),
                                    isLogged: AuthService.userIsLogged())
            entries.append(entry)
        }

        let timeline = Timeline(entries: entries, policy: .atEnd)
        completion(timeline)
    }
}

struct SimpleEntry: TimelineEntry {
    public let date: Date
    public let accounts: [Account]
    public let isLogged: Bool
}

struct TheBankWidgetEntryView: View {
    var entry: Provider.Entry
    @Environment(\.widgetFamily) private var widgetFamily

    var body: some View {
        ZStack {
            Color("WidgetBackground")

            VStack(alignment: .leading) {
                Title()
                switch widgetFamily {
                    case .systemSmall:
                        HStack {
                            AccountView(data: entry.accounts[0])
                        }
                    case .systemMedium:
                        HStack {
                            Link(destination: URL(string: URL.appHomeUrl+URL.appPersonalPath)!, label: {
                                AccountView(data: entry.accounts[0])
                            })
                            Link(destination: URL(string: URL.appHomeUrl+URL.appFamilyPath)!, label: {
                                AccountView(data: entry.accounts[1])
                            })
                        }
                    case .systemLarge:
                        AccountViewLarge(data: entry.accounts[0])
                        AccountViewLarge(data: entry.accounts[1])
                    @unknown default:
                        AccountView(data: entry.accounts[0])
                }

                Spacer()
            }
            .padding(.all, 20.0)
        }
    }
}

struct TheBankWidget_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            TheBankWidgetEntryView(entry: SimpleEntry(date: Date(),
                                                      accounts: AccountService().accounts(),
                                                      isLogged: AuthService.userIsLogged()))
                .previewContext(WidgetPreviewContext(family: .systemSmall))

            TheBankWidgetEntryView(entry: SimpleEntry(date: Date(),
                                                      accounts: AccountService().accounts(),
                                                      isLogged: false))
                .previewContext(WidgetPreviewContext(family: .systemSmall))
                .redacted(reason: .placeholder)

            TheBankWidgetEntryView(entry: SimpleEntry(date: Date(),
                                                      accounts: AccountService().accounts(),
                                                      isLogged: AuthService.userIsLogged()))
                .previewContext(WidgetPreviewContext(family: .systemMedium))
            TheBankWidgetEntryView(entry: SimpleEntry(date: Date(),
                                                      accounts: AccountService().accounts(),
                                                      isLogged: false))
                .previewContext(WidgetPreviewContext(family: .systemMedium))
                .redacted(reason: .placeholder)

            TheBankWidgetEntryView(entry: SimpleEntry(date: Date(),
                                                      accounts: AccountService().accounts(),
                                                      isLogged: AuthService.userIsLogged()))
                .previewContext(WidgetPreviewContext(family: .systemLarge))
            TheBankWidgetEntryView(entry: SimpleEntry(date: Date(),
                                                      accounts: AccountService().accounts(),
                                                      isLogged: false))
                .previewContext(WidgetPreviewContext(family: .systemLarge))
                .redacted(reason: .placeholder)
        }
    }
}
