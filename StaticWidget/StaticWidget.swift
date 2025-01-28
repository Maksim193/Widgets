//
//  StaticWidget.swift
//  StaticWidget
//
//  Created by Максим Косников on 10.01.2025.
//

import WidgetKit
import SwiftUI

struct Provider: AppIntentTimelineProvider {
	typealias Entry = SimpleEntry
	typealias Intent = TestWidgetConfigurationIntent
	
	func snapshot(for configuration: TestWidgetConfigurationIntent, in context: Context) async -> SimpleEntry {
//		let color = configuration.widget?/*.first?*/.string ?? "purple"
		let color = configuration.widget?.string
		let entry = SimpleEntry(date: Date(), emoji: "", color: color)
		return entry
	}
	
	func timeline(for configuration: TestWidgetConfigurationIntent, in context: Context) async -> Timeline<SimpleEntry> {
//		let color = configuration.widget?/*.first?*/.string ?? "purple"
		let color = configuration.widget?.string
		let timeline = Timeline(
			entries: [
				SimpleEntry(date: Date(), emoji: "", color: color)
			],
			policy: .never
		)
		return timeline
	}
	
	func placeholder(in context: Context) -> SimpleEntry {
		SimpleEntry(date: Date(), emoji: "", color: "purple")
	}
}

struct SimpleEntry: TimelineEntry {
    let date: Date
    let emoji: String
	let color: String?
}

struct StaticWidgetEntryView : View {
    var entry: Provider.Entry

    var body: some View {
		ZStack {
			Color(uiColor: UIColor().named(entry.color ?? "purple")!)
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

	@MainActor
    var body: some WidgetConfiguration {
		AppIntentConfiguration(
			kind: kind,
			intent: TestWidgetConfigurationIntent.self,
			provider: Provider()
		) { entry in
			if #available(iOS 17.0, *) {
				StaticWidgetEntryView(entry: entry)
					.containerBackground(.fill.tertiary, for: .widget)
			} else {
				StaticWidgetEntryView(entry: entry)
			}
		}
		.configurationDisplayName("configurationDisplayName")
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
