//
//  DigitalClockWidgetPreviewView.swift
//  WidgetExtension
//
//  Created by Максим Косников on 24.03.2025.
//

import SwiftUI
import SwiftData

struct DigitalClockWidgetPreviewView: View {
	let widgetModel: DigitalClockWidgetPreviewModel
	
	var body: some View {
		ZStack {
			Color(widgetModel.backgroundColor)
			if let image = widgetModel.backgroundImage {
				Image(uiImage: image)
					.resizable()
			}
			VStack {
				Text(Date(), format: .dateTime.hour().minute())
					.font(widgetModel.font.value)
			}
			.foregroundStyle(widgetModel.foregroundColor)
		}
	}
}

#Preview {
	WidgetView(
		type: .small,
		widgetModel: WidgetPreviewModel(
			id: "",
			name: "",
			type: .digitalClock(
				.init(
					backgroundImage: nil,
					backgroundColor: .purple,
					foregroundColor: .green,
					font: .stickNoBills
				)
			)
		)
	)
}
