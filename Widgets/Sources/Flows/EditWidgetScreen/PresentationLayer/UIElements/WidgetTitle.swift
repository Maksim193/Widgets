//
//  WidgetTitle.swift
//  Widgets
//
//  Created by Максим Косников on 07.01.2025.
//

import SwiftUI

struct WidgetTitle: View {
    @Binding var title: String
    
    var body: some View {
        TextField("Widget title", text: $title)
            .font(.system(size: 17, weight: .regular))
            .padding(14)
            .background(Material.ultraThin.opacity(0.5))
            .cornerRadius(10)
            .padding(.horizontal, 16)
    }
}

#Preview {
    NavigationStack {
        EditWidgetView(viewModel: EditWidgetViewModel())
    }
}
