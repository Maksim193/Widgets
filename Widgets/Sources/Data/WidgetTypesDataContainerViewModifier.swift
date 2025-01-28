//
//  WidgetTypesDataContainerViewModifier.swift
//  WidgetExtension
//
//  Created by Максим Косников on 28.01.2025.
//

import SwiftUI
import SwiftData

struct WidgetTypesDataContainerViewModifier: ViewModifier {
	let container: ModelContainer
	
	init(inMemory: Bool) {
		container = try! ModelContainer(for: DataGeneration.schema, configurations: [ModelConfiguration(isStoredInMemoryOnly: inMemory)])
	}
	
	func body(content: Content) -> some View {
		content
			.generateData()
			.modelContainer(container)
	}
}

struct GenerateDataViewModifier: ViewModifier {
	@Environment(\.modelContext) private var modelContext
	
	func body(content: Content) -> some View {
		content.onAppear {
			DataGeneration.generateAllData(modelContext: modelContext)
		}
	}
}

public extension View {
	func backyardBirdsDataContainer() -> some View {
		modifier(WidgetTypesDataContainerViewModifier(inMemory: false))
	}
}

fileprivate extension View {
	func generateData() -> some View {
		modifier(GenerateDataViewModifier())
	}
}

@Model public class DataGeneration {
	public var initializationDate: Date?
	public var lastSimulationDate: Date?
	
	static let container = try! ModelContainer(for: schema, configurations: [.init(isStoredInMemoryOnly: false)])
	static let schema = SwiftData.Schema([
		DataGeneration.self,
		WidgetModel.self
	])
	
	public init(initializationDate: Date?, lastSimulationDate: Date?) {
		self.initializationDate = initializationDate
		self.lastSimulationDate = lastSimulationDate
	}
	
	public static func generateAllData(modelContext: ModelContext) {
		let instance = instance(with: modelContext)
//		instance.modelContext?.insert(
//			WidgetModel(
//				name: "generateAllData"
//			)
//		)
	}
	
//	public static func generateData(
	
	private static func instance(with modelContext: ModelContext) -> DataGeneration {
		if let result = try! modelContext.fetch(FetchDescriptor<DataGeneration>()).first {
			return result
		} else {
			let instance = DataGeneration(
				initializationDate: nil,
				lastSimulationDate: nil
			)
			modelContext.insert(instance)
			return instance
		}
	}
}
