//
//  BackgrounView.swift
//  WidgetExtension
//
//  Created by Николай Чунихин on 23.03.2025.
//

import SwiftUI

struct BackgroundView<Content: View>: View {
    let colors: [Color]
    let content: Content
    
    init(colors: [Color], @ViewBuilder content: () -> Content) {
        self.colors = colors
        self.content = content()
    }
    
    var body: some View {
        ZStack {
            LinearGradient(
                gradient: .init(colors: colors),
                startPoint: .top,
                endPoint: .bottom
            ).edgesIgnoringSafeArea(.all)
            content
        }
    }
}
