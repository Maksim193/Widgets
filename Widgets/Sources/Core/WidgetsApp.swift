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
	var sharedModelContainer: ModelContainer = {
		do {
			return try ModelContainer(for: WidgetModel.self, configurations: ModelConfiguration(isStoredInMemoryOnly: true))
		} catch {
			fatalError("Could not create ModelContainer: \(error)")
		}
	}()
	
    var body: some Scene {
        WindowGroup {
            NavigationStack {
                MainView(viewModel: .init())
			}
        }
		.modelContainer(sharedModelContainer)
    }
}

