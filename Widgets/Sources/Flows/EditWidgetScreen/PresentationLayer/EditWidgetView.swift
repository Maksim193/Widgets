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
        BackgroundView(colors: [
            Color(.mainApp),
            Color(.mainApp),
            Color(.backgroundSecondary)
        ]) {
            VStack {
                WidgetTitle(title: $viewModel.widgetTitle)
                    .padding(.top, 32)
                WidgetsPageView()
                EditWidgetButtonsPanelView {
                    viewModel.openTypeBottomSheet()
                } backgroundAction: {
                    viewModel.openBackgroundBottomSheet()
                } styleAction: {
                    viewModel.openStyleBottomSheet()
                }
                SaveButton {
                    viewModel.saveWidget()
                }
                .padding(.bottom, 16)
            }
        }
        .navigationTitle("EditWidgetView.title")
        .toolbarBackground(.blue, for: .navigationBar)
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarBackButtonHidden(true)
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                CustomBackButton()
            }
        }
        .ignoresSafeArea(.keyboard, edges: .bottom)
    }
}

#Preview {
    NavigationStack {
        EditWidgetView(viewModel: EditWidgetViewModel())
    }
    
}
