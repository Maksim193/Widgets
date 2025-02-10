//
//  HomescreenWidgetConfigurationIntent.swift
//  WidgetExtension
//
//  Created by Максим Косников on 27.01.2025.
//

import AppIntents

struct HomescreenWidgetConfigurationIntent: WidgetConfigurationIntent {
	static var title: LocalizedStringResource = "Events"
	static var description = IntentDescription("Description")
	
	@Parameter(title: "Виджет")
	var widget: HomescreenWidgetAppIntent?
}
