//
//  WidgetsPageView.swift
//  Widgets
//
//  Created by Максим Косников on 06.01.2025.
//

import SwiftUI

struct WidgetsPageView: View {
	var body: some View {
		TabView {
			SmallWidget()
			MediumWidget()
			LargeWidget()
		}
		.tabViewStyle(.page)
		.indexViewStyle(.page(backgroundDisplayMode: .always))
	}
}

#Preview {
	EditWidgetView(viewModel: EditWidgetViewModel())
}
