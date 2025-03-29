//
//  EditWidgetButton.swift
//  Widgets
//
//  Created by Николай Чунихин on 29.03.2025.
//

import SwiftUI

struct EditWidgetButton: View {
    
    var text: String
    var image: Image
    var action: () -> Void
    
    var body: some View {
        VStack {
            Button {
                action()
            } label: {
                image
                    .resizable()
                    .scaledToFit()
                    .frame(width: 40, height: 40)
                    .tint(.white)
                    .padding()
                    .background(
                        RoundedRectangle(cornerRadius: 20)
                            .foregroundStyle(Color(.mainApp))
                    )
                    
            }
            .frame(width: 60, height: 60)
            .padding(.bottom, 6)

            Text(text)
                .font(.system(size: 12))
        }
    }
}

#Preview {
    EditWidgetButton(text: "Тип", image: Image(.background)) {
        
    }
    
    EditWidgetButton(text: "Тип", image: Image(.style)) {
        
    }
}
