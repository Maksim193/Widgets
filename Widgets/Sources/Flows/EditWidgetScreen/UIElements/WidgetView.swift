//
//  WidgetView.swift
//  Widgets
//
//  Created by Максим Косников on 06.01.2025.
//

import SwiftUI
import SwiftData

struct WidgetView: View {
	let type: WidgetViewSizeType
	
	var body: some View {
		let width: CGFloat = {
			let screenWidth = UIScreen.main.bounds.size.width
			switch self.type {
			case .small:
				return screenWidth / 2.5
			case .medium, .large:
				return screenWidth / 1.2
			}
		}()
		let height: CGFloat = {
			let screenHeight = UIScreen.main.bounds.size.height
			switch self.type {
			case .small, .medium:
				return screenHeight / 5.4
			case .large:
				return screenHeight / 2.4
			}
		}()
		Color(.gray)
			.frame(width: width, height: height)
			.cornerRadius(20)
	}
}

#Preview {
		let schema = Schema([
			WidgetModel.self,
		])
		let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: true)
		
	let container =  try! ModelContainer(for: schema, configurations: [modelConfiguration])
	EditWidgetView(viewModel: EditWidgetViewModel())
		.modelContainer(container)
}
