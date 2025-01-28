//
//  EditWidgetView.swift
//  Widgets
//
//  Created by Максим Косников on 06.01.2025.
//

import SwiftUI

struct EditWidgetView: View {
	@StateObject var viewModel: EditWidgetViewModel
	
	var body: some View {
			VStack {
				WidgetTitle(title: viewModel.widgetTitle)
					.padding([.top], 24)
				WidgetsPageView()
				Text("EditWidgetView.ChangeWidgetTitle")
					.font(.headline)
				EditWidgetButtons(editWidgetButtonsModel: viewModel.editWidgetButtons)
					.padding([.bottom], 32)
				SaveButton()
					.backyardBirdsDataContainer()
			}
			.navigationTitle("EditWidgetView.title")
			.navigationBarTitleDisplayMode(.inline)
		}
}

#Preview {
	NavigationStack {
		EditWidgetView(viewModel: EditWidgetViewModel())
	}
}
