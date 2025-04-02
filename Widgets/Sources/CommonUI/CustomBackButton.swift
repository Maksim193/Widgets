//
//  CustomBackButton.swift
//  Widgets
//
//  Created by Николай Чунихин on 29.03.2025.
//

import SwiftUI

struct CustomBackButton: View {
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        Button(action: {
            presentationMode.wrappedValue.dismiss()
        }) {
            HStack {
                Image(systemName: "chevron.left")
                    .foregroundColor(.black)
            }
        }
    }
}

#Preview {
    CustomBackButton()
}
