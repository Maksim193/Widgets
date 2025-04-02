//
//  GradientBackground.swift
//  Widgets
//
//  Created by Николай Чунихин on 13.01.2025.
//

import SwiftUI

struct GradientBackground: View {
    @State var gradient: Gradient = Gradient(
        colors: [
            Color(.backgroundMain),
            Color(.backgroundMain),
            
        ]
    )
    var body: some View {
        Rectangle()
            .fill(
                LinearGradient(
                    gradient: gradient,
                    startPoint: .top,
                    endPoint: .bottom
                )
            )
    }
}

#Preview {
    GradientBackground()
        .ignoresSafeArea(.all)
}
