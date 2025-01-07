//
//  MainView.swift
//  Widgets
//
//  Created by Николай Чунихин on 06.01.2025.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        ZStack {
            Color(.white)
            VStack {
                HStack {
                    Spacer()
                    Button {
                        // переход на экран создания
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
                Spacer()
            }
        }
    }
}

#Preview {
    NavigationStack {
        MainView()
    }
}
