//
//  HomescreenWidgetProvider.swift
//  WidgetExtension
//
//  Created by Максим Косников on 10.02.2025.
//

import UIKit
import WidgetKit

struct HomescreenWidgetProvider: AppIntentTimelineProvider {
	typealias Entry = HomescreenWidgetEntry
	typealias ConfigurationIntent = HomescreenWidgetConfigurationIntent
	
	func snapshot(for configuration: ConfigurationIntent, in context: Context) async -> Entry {
		let entry = HomescreenWidgetEntry(date: Date(), type: .example)
		return entry
	}
	
	func timeline(for configuration: ConfigurationIntent, in context: Context) async -> Timeline<Entry> {
		let nextUpdate: Date = .now.addingTimeInterval(60)
		let entry = self.mapConfigurationIntent(configuration)
		return Timeline(entries: [entry], policy: .after(nextUpdate))
	}
	
	func placeholder(in context: Context) -> Entry {
		let entry = HomescreenWidgetEntry(date: Date(), type: .example)
		return entry
	}
	
	private func mapConfigurationIntent(_ configuration: ConfigurationIntent) -> Entry {
		switch configuration.widget?.widgetType {
		case .example:
			return Entry(date: Date(), type: .example)
		case .digitalClock(let digitalClock):
			return Entry(
				date: Date(),
				type: .digitalClock(self.mapDigitalClockIntent(digitalClock))
			)
		case nil:
			return Entry(date: Date(), type: .example)
		}
	}
	
	private func mapDigitalClockIntent(_ intent: WidgetAppIntentType.DigitalClock) -> DigitalClockWidgetEntry {
		DigitalClockWidgetEntry(
			date: Date(),
			backgroundColor: intent.backgroundColor,
			foregroundColor: intent.foregroundColor,
			image: intent.image,
			font: intent.font
		)
	}
}
