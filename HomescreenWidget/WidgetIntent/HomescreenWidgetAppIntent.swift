//
//  HomescreenWidgetAppIntent.swift
//  WidgetExtension
//
//  Created by Максим Косников on 27.01.2025.
//

import AppIntents
import SwiftData
import UIKit

struct HomescreenWidgetAppIntent: AppEntity {
	var id: String
	var widgetName: String
	var image: UIImage?
	
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
				return HomescreenWidgetAppIntent(id: $0.id, widgetName: $0.name, image: image)
			}
		}
	}
}
