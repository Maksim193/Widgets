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
                EditWidgetButtons(editWidgetButtonsModel: viewModel.editWidgetButtons)
                    .padding([.bottom], 32)
                SaveButton()
            }
        }
        .navigationTitle("EditWidgetView.title")
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarBackButtonHidden(true) // Скрытие стандартной кнопки
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                CustomBackButton()
            }
        }
    }
}

struct CustomBackButton: View {
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        Button(action: {
            presentationMode.wrappedValue.dismiss()
        }) {
            HStack {
                Image(systemName: "chevron.left")
                    .foregroundColor(.black)
            }
        }
    }
}

#Preview {
    NavigationStack {
        EditWidgetView(viewModel: EditWidgetViewModel())
    }
}
