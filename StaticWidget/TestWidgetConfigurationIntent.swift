//
//  TestWidgetConfigurationIntent.swift
//  WidgetExtension
//
//  Created by Максим Косников on 27.01.2025.
//

import AppIntents

struct TestWidgetConfigurationIntent: WidgetConfigurationIntent {
	static var title: LocalizedStringResource = "Events"
	static var description = IntentDescription("Selects the character to display information for.")
	
//	@Parameter(title: "@ParameterTitle", size: .init(exactly: 1))
//	var widget: [EventAppIntent]?
	
//	@Parameter(title: "@ParameterTitle", default: EventAppIntent(id: "1", string: "color"))
	@Parameter(title: "@ParameterTitle")
		var widget: EventAppIntent?
}
