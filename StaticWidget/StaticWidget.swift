//
//  StaticWidget.swift
//  StaticWidget
//
//  Created by Максим Косников on 10.01.2025.
//

import WidgetKit
import SwiftUI

struct Provider: TimelineProvider {
    func placeholder(in context: Context) -> SimpleEntry {
		SimpleEntry(date: Date(), emoji: "😀", color: "black")
    }

    func getSnapshot(in context: Context, completion: @escaping (SimpleEntry) -> ()) {
        let entry = SimpleEntry(date: Date(), emoji: "😀", color: "white")
        completion(entry)
    }

    func getTimeline(in context: Context, completion: @escaping (Timeline<Entry>) -> ()) {
        var entries: [SimpleEntry] = []
		
        // Generate a timeline consisting of five entries an hour apart, starting from the current date.
        let currentDate = Date()
        for hourOffset in 0 ..< 30 {
            let entryDate = Calendar.current.date(byAdding: .second, value: hourOffset, to: currentDate)!
			let value = UserDefaults(suiteName: "group.ru.maksim.widgets")?.string(forKey: "color") ?? "purple"
            let entry = SimpleEntry(date: entryDate, emoji: "😀", color: value)
            entries.append(entry)
        }

        let timeline = Timeline(entries: entries, policy: .atEnd)
        completion(timeline)
    }

//    func relevances() async -> WidgetRelevances<Void> {
//        // Generate a list containing the contexts this widget is relevant in.
//    }
}

struct SimpleEntry: TimelineEntry {
    let date: Date
    let emoji: String
	let color: String
}

struct StaticWidgetEntryView : View {
    var entry: Provider.Entry

    var body: some View {
		ZStack {
			Color(uiColor: UIColor().named(entry.color)!)
			VStack {
				Text("Time:")
				Text(entry.date, format: .dateTime.hour().minute().second())
				
				Text("Emoji:")
				Text(entry.emoji)
			}
		}
    }
}

struct StaticWidget: Widget {
    let kind: String = "StaticWidget"

    var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind, provider: Provider()) { entry in
            if #available(iOS 17.0, *) {
                StaticWidgetEntryView(entry: entry)
                    .containerBackground(.fill.tertiary, for: .widget)
            } else {
                StaticWidgetEntryView(entry: entry)
                    .padding()
                    .background()
            }
        }
        .configurationDisplayName("My Widget")
        .description("This is an example widget.")
    }
}

#Preview(as: .systemSmall) {
    StaticWidget()
} timeline: {
	SimpleEntry(date: .now, emoji: "😀", color: "purple")
    SimpleEntry(date: .now, emoji: "🤩", color: "purple")
}


extension UIColor {
	public func named(_ name: String) -> UIColor? {
		let allColors: [String: UIColor] = [
			"red": .red,
			"black": .black,
			"green": .green,
			"purple": .purple
		]
		let cleanedName = name.replacingOccurrences(of: " ", with: "").lowercased()
		return allColors[cleanedName]
	}
}
