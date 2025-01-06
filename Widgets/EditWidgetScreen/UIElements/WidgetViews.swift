//
//  WidgetViews.swift
//  Widgets
//
//  Created by Максим Косников on 06.01.2025.
//

import SwiftUI

struct SmallWidget: View {
	var body: some View {
		Color(.gray)
			.frame(width: 170, height: 170)
			.cornerRadius(20)
	}
}

struct MediumWidget: View {
	var body: some View {
		Color(.gray)
			.frame(width: 364, height: 200)
			.cornerRadius(20)
	}
}

struct LargeWidget: View {
	var body: some View {
		Color(.gray)
			.frame(width: 364, height: 382)
			.cornerRadius(20)
	}
}

#Preview {
	EditWidgetView(viewModel: EditWidgetViewModel())
}
