//
//  Repository.swift
//  Widgets
//
//  Created by Максим Косников on 27.03.2025.
//

import SwiftData

protocol RepositoryProtocol {
	func getWidgetsData() -> [WidgetModel]
	func saveWidget(_ widget: WidgetModel)
}

final class Repository {
	
	private let modelContext: ModelContext
	
	init() {
		let modelContainer = try! ModelContainer(for: WidgetModel.self)
		self.modelContext = ModelContext(modelContainer)
	}
}

// MARK: - RepositoryProtocol

extension Repository: RepositoryProtocol {
	func getWidgetsData() -> [WidgetModel] {
		do {
			let widgets = try modelContext.fetch(FetchDescriptor<WidgetModel>())
			return widgets
		} catch {
			return []
		}
	}
	
	func saveWidget(_ widget: WidgetModel) {
		modelContext.insert(widget)
	}
}
