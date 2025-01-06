//
//  WidgetTitle.swift
//  Widgets
//
//  Created by Максим Косников on 07.01.2025.
//

import SwiftUI

struct WidgetTitle: View {
	var title: String
	
	var body: some View {
		HStack {
			Text(title)
			Image(systemName: "square.and.pencil")
		}
		.font(.title3)
		.background(alignment: .center) {
			Color(.lightGray)
				.cornerRadius(16)
				.padding(-10)
				.opacity(0.2)
		}
	}
}
