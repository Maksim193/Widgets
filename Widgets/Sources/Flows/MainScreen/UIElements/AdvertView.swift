//
//  AdvertView.swift
//  Widgets
//
//  Created by Николай Чунихин on 08.01.2025.
//

import SwiftUI

struct AdvertView: View {
    
    let action: () -> Void
    
    var body: some View {
        Button {
            action()
        } label: {
            VStack {
                Text("Скачай справочник СПЗ")
                    .font(
                        .system(
                            size: 27,
                            weight: .semibold,
                            design: .rounded
                        )
                    )
                    .padding(.bottom)
                HStack {
                    Text("erid: xxxxx")
                    Spacer()
                }
            }
            .foregroundColor(.white)
            .padding()
            .frame(maxWidth: .infinity)
            .background(Color.orange)
            .cornerRadius(20)
            .padding(.horizontal, 20)
        }
    }
}

#Preview {
    AdvertView {
        
    }
}
