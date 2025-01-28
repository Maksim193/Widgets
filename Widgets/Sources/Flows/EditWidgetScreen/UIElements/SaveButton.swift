//
//  SaveButton.swift
//  Widgets
//
//  Created by Максим Косников on 07.01.2025.
//

import SwiftUI
import SwiftData

struct SaveButton: View {
	@Query private var widgets: [WidgetModel]
	@Environment(\.modelContext) private var modelContext
	
	var body: some View {
		Button {
			setValue()
		} label: {
			ZStack {
				Color(.black)
					.cornerRadius(16)
					.frame(height: 60)
					.padding([.leading, .trailing])
				Text("EditWidgetView.SaveButton")
					.font(.headline)
					.foregroundStyle(.white)
			}
		}
	}
	
	func setValue() {
		UserDefaults(suiteName: "group.ru.maksim.widgets")?.set("green", forKey: "color")
		let newWidgetModel = WidgetModel(name: "red")
//		widgets.append(newWidgetModel)
		modelContext.insert(newWidgetModel)
	}
}
