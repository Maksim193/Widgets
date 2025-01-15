//
//  WidgetRowView.swift
//  Widgets
//
//  Created by Николай Чунихин on 08.01.2025.
//

import SwiftUI

struct WidgetRowView: View {
    
    let widget: Widget
    
    var body: some View {
        WidgetView(type: .medium)
        Text(widget.title)
    }
}

#Preview {
    WidgetRowView(widget: .init(title: "Hello World"))
}
