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
	
    var body: some Scene {
        WindowGroup {
            NavigationStack {
                MainView(viewModel: .init())
			}
        }
    }
}
