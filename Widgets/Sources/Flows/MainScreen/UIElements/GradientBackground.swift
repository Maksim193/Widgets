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
            .purple.opacity(0.8),
            .pink.opacity(0.4),
            .pink.opacity(0.3),
            .white
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
