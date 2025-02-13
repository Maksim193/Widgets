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
	let widgetModel: WidgetPreviewModel
	
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
		
		HStack {
			switch widgetModel.type {
			case .example:
				Color(.gray)
			case .digitalClock(let digitalClockModel):
				DigitalClockWidgetPreviewView(widgetModel: digitalClockModel)
			}
		}
		.frame(width: width, height: height)
		.cornerRadius(20)
	}
}

struct DigitalClockWidgetPreviewView: View {
	let widgetModel: DigitalClockWidgetPreviewModel
	
	var body: some View {
		ZStack {
			if let image = widgetModel.backgroundImage {
				Image(uiImage: image)
					.resizable()
			}
			VStack {
				Text("Time:")
				Text(Date(), format: .dateTime.hour().minute().second())
			}
		}
	}
}
