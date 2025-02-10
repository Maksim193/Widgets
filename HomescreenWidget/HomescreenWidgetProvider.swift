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
		let color = configuration.widget?.widgetName
		let entry = Entry(date: Date(), color: color, image: configuration.widget?.image)
		return entry
	}
	
	func timeline(for configuration: ConfigurationIntent, in context: Context) async -> Timeline<Entry> {
		var entries: [HomescreenWidgetEntry] = []
		let currentDate = Date()
		for secondOffset in 0 ..< 1000 {
			let entryDate = Calendar.current.date(byAdding: .second, value: secondOffset, to: currentDate)!
			let color = configuration.widget?.widgetName
			let entry = Entry(date: entryDate, color: color, image: configuration.widget?.image)
			entries.append(entry)
		}
		return Timeline(entries: entries, policy: .atEnd)
	}
	
	func placeholder(in context: Context) -> Entry {
		Entry(date: Date(), color: nil, image: nil)
	}
}
