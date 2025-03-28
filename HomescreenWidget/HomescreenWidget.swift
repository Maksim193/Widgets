//
//  HomescreenWidget.swift
//  HomescreenWidget
//
//  Created by Максим Косников on 10.01.2025.
//

import WidgetKit
import SwiftUI

struct HomescreenWidget: Widget {
	let kind: String = "HomescreenWidget"

	@MainActor
	var body: some WidgetConfiguration {
		AppIntentConfiguration(
			kind: kind,
			intent: HomescreenWidgetConfigurationIntent.self,
			provider: HomescreenWidgetProvider()
		) { entry in
			StaticWidgetEntryView(entry: entry)
				.containerBackground(.black, for: .widget)
		}
		.configurationDisplayName("MyWidget")
	}
}

#Preview(as: .systemSmall) {
	HomescreenWidget()
} timeline: {
	HomescreenWidgetEntry(date: .now, color: "purple", image: nil, font: .custom("DotGothic16-Regular", size: 48))
}
