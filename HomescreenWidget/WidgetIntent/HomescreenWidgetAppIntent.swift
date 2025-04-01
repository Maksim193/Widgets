//
//  HomescreenWidgetAppIntent.swift
//  WidgetExtension
//
//  Created by Максим Косников on 27.01.2025.
//

import AppIntents
import SwiftData
import SwiftUI

enum WidgetAppIntentType {
	case example
	case digitalClock(DigitalClock)
	
	struct DigitalClock {
		var image: UIImage?
		var backgroundColor: Color
		var foregroundColor: Color
		var font: Font
	}
}

struct HomescreenWidgetAppIntent: AppEntity {
	
	var id: String
	var widgetName: String
	var widgetType: WidgetAppIntentType
	
	static var typeDisplayRepresentation: TypeDisplayRepresentation = "TypeDisplayRepresentation"
	static var defaultQuery = HomescreenWidgetQuery()
	
	var displayRepresentation: DisplayRepresentation {
		DisplayRepresentation(title: "\(widgetName)")
	}
}

struct HomescreenWidgetQuery: EntityQuery {
	
	func entities(for identifiers: [HomescreenWidgetAppIntent.ID]) async throws -> [HomescreenWidgetAppIntent] {
		await fetchWidgetIntents()
	}
	
	func suggestedEntities() async throws -> [HomescreenWidgetAppIntent] {
		await fetchWidgetIntents()
	}
	
	func defaultResult() async -> HomescreenWidgetAppIntent? {
		await fetchWidgetIntents().first
	}
	
	private func fetchWidgetIntents() async -> [HomescreenWidgetAppIntent] {
		let modelContainer = try! ModelContainer(for: WidgetModel.self)
		let modelContext = ModelContext(modelContainer)
		let widgets = try! modelContext.fetch(FetchDescriptor<WidgetModel>())
		return widgets.compactMap {
			switch $0.type {
			case .example:
				return nil
			case .digitalClock(let model):
				let image = UIImage(data: model.backgroundImage)
				let font = self.mapFont(model.font)
				let backgroundColor = Color(hex: model.backgroundColorHEX)
				let foregroundColor = Color(hex: model.foregroundColorHEX)
				let digitalClockIntent = WidgetAppIntentType.DigitalClock(
					image: image,
					backgroundColor: backgroundColor,
					foregroundColor: foregroundColor,
					font: font
				)
				return HomescreenWidgetAppIntent(
					id: $0.id,
					widgetName: $0.name,
					widgetType: .digitalClock(digitalClockIntent)
				)
			}
		}
	}
	
	private func mapFont(_ fontString: String) -> Font {
		switch fontString {
		case "Montserrat":
			return .custom("Montserrat-Regular", size: 40)
		case "Michroma":
			return .custom("Michroma-Regular", size: 24)
		case "StickNoBills":
			return .custom("StickNoBills-Regular", size: 48)
		case "DotGothic16":
			return .custom("DotGothic16-Regular", size: 40)
		case "RalewayDots":
			return .custom("RalewayDots-Regular", size: 48)
		case "SFPro":
			return .system(size: 40)
		default:
			return .system(size: 1)
		}
	}
}
