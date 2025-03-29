//
//  SaveButton.swift
//  Widgets
//
//  Created by Максим Косников on 07.01.2025.
//

import SwiftUI

struct SaveButton: View {
    
    var action: () -> Void
    
    var body: some View {
        Button {
            action()
        } label: {
            Text("EditWidgetView.SaveButton")
                .font(.system(size: 20, weight: .semibold))
                .frame(maxWidth: .infinity)
                .frame(height: 52)
                .background(Color(.mainApp))
                .foregroundColor(.white)
                .clipShape(RoundedRectangle(cornerRadius: 13))
                .shadow(color: .gray.opacity(0.3), radius: 5, x: 0, y: 3)
        }
        .padding(.horizontal, 20)
    }
    
}

#Preview {
    EditWidgetView(viewModel: EditWidgetViewModel())
}
