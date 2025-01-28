//
//  EventAppIntent.swift
//  WidgetExtension
//
//  Created by Максим Косников on 27.01.2025.
//

import AppIntents
import AppIntents
import SwiftData

struct EventAppIntent: AppEntity {
	var id: String
	var string: String
	
	static var typeDisplayRepresentation: TypeDisplayRepresentation = "TypeDisplayRepresentation"
	static var defaultQuery = WidgetQuery()
	
	var displayRepresentation: DisplayRepresentation {
		DisplayRepresentation(title: "DisplayRepresentation")
	}
}

struct WidgetQuery: EntityQuery {
	
	func entities(for identifiers: [EventAppIntent.ID]) async throws -> [EventAppIntent] {
		await fetchEventIntents()
	}
	
	func suggestedEntities() async throws -> [EventAppIntent] {
		await fetchEventIntents()
	}
	
	func defaultResult() async -> EventAppIntent? {
		await fetchEventIntents().first
	}
	
	private func fetchEventIntents() async -> [EventAppIntent] {
		return [
			EventAppIntent(id: "1", string: "first"),
			EventAppIntent(id: "2", string: "second"),
			EventAppIntent(id: "3", string: "third")
		]
	}
}
