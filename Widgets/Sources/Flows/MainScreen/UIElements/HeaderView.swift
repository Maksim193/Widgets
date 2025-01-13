//
//  HeaderView.swift
//  Widgets
//
//  Created by Николай Чунихин on 13.01.2025.
//

import SwiftUI

struct HeaderView: View {
    let action: () -> Void
    
    var body: some View {
        VStack {
            HStack {
                Text("My widgets")
                    .font(.system(size: 28, weight: .bold))
                    .padding(.leading, 15)
                Spacer()
                CreateButton(action: {
                    action()
                })
                .padding()
            }
            .background(Material.ultraThin)
            Spacer()
        }
    }
}

#Preview {
    HeaderView{
        print(123)
    }
}
