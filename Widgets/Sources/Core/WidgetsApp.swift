//
//  WidgetsApp.swift
//  Widgets
//
//  Created by Максим Косников on 26.12.2024.
//

import SwiftUI
import SwiftData

@main
struct WidgetsApp: App {
	private let repository: RepositoryProtocol
	private let widgetsDataWorker:WidgetsDataWorkerProtocol
	private let sharedModelContainer: ModelContainer
	
	init() {
		self.repository = Repository()
		self.widgetsDataWorker = WidgetsDataWorker(repository: repository)
		do {
			self.sharedModelContainer = try ModelContainer(for: WidgetModel.self)
		} catch {
			 fatalError("Could not create ModelContainer: \(error)")
		 }
	}
	
    var body: some Scene {
        WindowGroup {
            NavigationStack {
				MainView(
					viewModel: MainViewModel(
						widgetsDataWorker: self.widgetsDataWorker
					)
				)
			}
        }
		.modelContainer(sharedModelContainer)
    }
}

