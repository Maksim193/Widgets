//
//  WidgetTypesDataContainerViewModifier.swift
//  WidgetExtension
//
//  Created by Максим Косников on 28.01.2025.
//

import Foundation
import SwiftUI
import SwiftData

struct WidgetTypesDataContainerViewModifier: ViewModifier {
	let container: ModelContainer
	
	init(inMemory: Bool) {
//		do {
		container = try! ModelContainer(for: WidgetModel.self, migrationPlan: UsersMigrationPlan.self)
//			container = try! ModelContainer(for: WidgetModel.self)
//			container = DataGeneration.container
//		} catch {
//			print(error)
//			container = try! .init(for: WidgetModel.self, configurations: .init())
//		}
	}
	
	func body(content: Content) -> some View {
		content
			.modelContainer(container)
	}
}
public extension View {
	func backyardBirdsDataContainer() -> some View {
		modifier(WidgetTypesDataContainerViewModifier(inMemory: false))
	}
}

@Model public class DataGeneration {
	static let container = try! ModelContainer(for: schema, configurations: [.init(isStoredInMemoryOnly: false)])
	static let schema = SwiftData.Schema([
		DataGeneration.self,
		WidgetModel.self
	])
	
	init() {}
}
