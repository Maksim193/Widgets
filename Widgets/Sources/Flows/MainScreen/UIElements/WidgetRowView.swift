//
//  WidgetRowView.swift
//  Widgets
//
//  Created by Николай Чунихин on 08.01.2025.
//

import SwiftUI

struct WidgetRowView: View {
    
    let widgetModel: WidgetPreviewModel
    
    var body: some View {
		WidgetView(type: .medium, widgetModel: widgetModel)
        Text(widgetModel.name)
    }
}
