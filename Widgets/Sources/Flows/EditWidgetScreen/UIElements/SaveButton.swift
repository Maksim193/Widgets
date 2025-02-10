//
//  SaveButton.swift
//  Widgets
//
//  Created by Максим Косников on 07.01.2025.
//

import SwiftUI
import SwiftData

struct SaveButton: View {
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
		let digitalClockWidgetModel = DigitalClockWidgetModel(
			backgroundImage: (UIImage(systemName: "photo.artframe.circle.fill")?.jpegData(compressionQuality: .greatestFiniteMagnitude))!,
			font: "SF-Pro"
		)
		let newWidgetModel = WidgetModel(
			name: "green",
			type: .digitalClock(digitalClockWidgetModel)
		)
		modelContext.insert(newWidgetModel)
	}
}
