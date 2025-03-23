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
            Color(.backgroundMain),
            Color(.backgroundMain),
            Color(.backgroundSecondary)
        ]) {
            VStack {
                WidgetTitle(title: viewModel.widgetTitle)
                    .padding([.top], 24)
                WidgetsPageView()
                Text("EditWidgetView.ChangeWidgetTitle")
                    .font(.headline)
                EditWidgetButtons(editWidgetButtonsModel: viewModel.editWidgetButtons)
                    .padding([.bottom], 32)
                SaveButton()
            }
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
