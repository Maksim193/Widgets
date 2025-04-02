//
//  EditWidgetButtons.swift
//  Widgets
//
//  Created by Максим Косников on 07.01.2025.
//

import SwiftUI

struct EditWidgetButtonsPanelView: View {
    
    var typeAction: () -> Void
    var backgroundAction: () -> Void
    var styleAction: () -> Void
	
	var body: some View {
        HStack(spacing: 24) {
            EditWidgetButton(text: String(localized: "EditWidgetButtonTitle.Type") , image: Image(.clockType)) {
                typeAction()
            }
            
            EditWidgetButton(text: String(localized: "EditWidgetButtonTitle.Background"), image: Image(.background)) {
                backgroundAction()
            }
            
            EditWidgetButton(text: String(localized: "EditWidgetButtonTitle.Style"), image: Image(.style)) {
                styleAction()
            }
		}
        .padding()
        .background(Material.ultraThin.opacity(0.5))
        .clipShape(RoundedRectangle(cornerRadius: 35))
	}
}

#Preview {
    NavigationStack {
        EditWidgetView(viewModel: EditWidgetViewModel())
    }
}
