//
//  MainViewModel.swift
//  Widgets
//
//  Created by Николай Чунихин on 06.01.2025.
//

import Combine
import SwiftUI
import SwiftData

final class MainViewModel: ObservableObject {
	@Query private var widgets1: [WidgetModel]
    
    //MARK: Publishers
    @Published var isEditViewOpened = false
    @Published var isCreateViewOpened = false
    @Published var widgets: [Widget] = []
    
    //MARK: Init
    init() {
        getWidgets()
    }
    
    //MARK: Actions
    func routeEditWidget() {
        isEditViewOpened = true
    }
    
    func routeCreateWidget() {
        isCreateViewOpened = true
    }
    
    func routerAdvertisement() {
        print(#function)
    }
}

//MARK: - private methods
extension MainViewModel {
    func getWidgets() {
        self.widgets = [
            .init(title: "1st"),
            .init(title: "2nd"),
            .init(title: "3rd"),
            .init(title: "1st"),
            .init(title: "2nd"),
            .init(title: "3rd"),
            .init(title: "1st"),
            .init(title: "2nd"),
            .init(title: "3rd")
        ]
    }
}
