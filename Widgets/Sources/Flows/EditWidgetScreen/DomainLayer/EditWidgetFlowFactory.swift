//
//  EditWidgetFlowFactory.swift
//  Widgets
//
//  Created by Николай Чунихин on 23.03.2025.
//

import Foundation

enum EditWidgetFlowFactory {
    static func make() -> EditWidgetView {
        let viewModel = EditWidgetViewModel()
        return EditWidgetView(viewModel: viewModel)
    }
}
