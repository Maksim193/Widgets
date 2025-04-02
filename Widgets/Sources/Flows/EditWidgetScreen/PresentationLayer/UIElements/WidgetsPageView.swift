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
			WidgetView(type: .small, widgetModel: .init(id: "", name: "", type: .example))
			WidgetView(type: .medium, widgetModel: .init(id: "", name: "", type: .example))
			WidgetView(type: .large, widgetModel: .init(id: "", name: "", type: .example))
                .padding(.bottom, 20)
		}
        .tabViewStyle(.page(indexDisplayMode: .always))
        .onAppear {
            UIPageControl.appearance().currentPageIndicatorTintColor = .black
            UIPageControl.appearance().pageIndicatorTintColor = UIColor.black.withAlphaComponent(0.3)
        }
	}
}

#Preview {
    NavigationStack {
        EditWidgetView(viewModel: EditWidgetViewModel())
    }
}
