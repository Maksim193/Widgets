//
//  CreateButton.swift
//  Widgets
//
//  Created by Николай Чунихин on 08.01.2025.
//

import SwiftUI

struct CreateButton: View {
    let action: () -> Void
    
    var body: some View {
        Button {
            action()
        } label: {
            Text("MainView.button.createWidget")
                .tint(.black)
                .font(
                    .system(
                        size: 18,
                        weight: .bold,
                        design: .rounded
                    )
                )
                .padding()
        }
        .background(
            RoundedRectangle(cornerRadius: 30, style: .circular)
                .foregroundStyle(.gray.opacity(0.3))
                
        )
        .padding()
    }
}

#Preview {
    CreateButton{
        print(111)
    }
}
