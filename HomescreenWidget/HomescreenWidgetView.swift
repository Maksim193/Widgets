//
//  HomescreenWidgetView.swift
//  WidgetExtension
//
//  Created by Максим Косников on 10.02.2025.
//

import SwiftUI

struct StaticWidgetEntryView : View {
	var entry: HomescreenWidgetProvider.Entry

	var body: some View {
		ZStack {
			if let image = entry.image {
				Image(uiImage: image)
					.resizable()
			}
			VStack {
				Text(entry.date, format: .dateTime.hour().minute())
					.font(entry.font)
					.foregroundStyle(entry.foregroundColor)
			}
		}
		.containerBackground(entry.backgroundColor, for: .widget)
	}
}
