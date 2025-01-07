//
//  MainViewModel.swift
//  Widgets
//
//  Created by Николай Чунихин on 06.01.2025.
//

import Combine

final class MainViewModel: ObservableObject {
    
    //MARK: Publishers
    @Published var isEditViewOpen = false
    @Published var isCreateViewOpen = false
    @Published var widgets: [WidgetView] = []
    
    //MARK: init
    init() {
        getWidgets()
    }
    
    //MARK: actions
    func routeEditWidget() {
        isEditViewOpen = true
    }
    
    func routeCreateWidget() {
        isCreateViewOpen = true
    }
    
    func deleteWidget() {
        
    }
}

//MARK: - private methods
extension MainViewModel {
    func getWidgets() {
        self.widgets = [
            .init(type: .medium),
            .init(type: .medium),
            .init(type: .medium)
        ]
    }
}
