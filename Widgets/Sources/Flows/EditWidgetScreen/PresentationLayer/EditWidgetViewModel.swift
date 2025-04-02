//
//  EditWidgetViewModel.swift
//  Widgets
//
//  Created by Максим Косников on 06.01.2025.
//

import Combine
import SwiftUI

final class EditWidgetViewModel: ObservableObject {
    //MARK: Publishers
    @Published var widgetTitle: String = "Имя виджета"
    @Published var widgetType: String = "Тип виджета"
    @Published var widgetBackground: Color = .black
    @Published var widgetStyle: String = "Описание виджета"
    
    
    /// Если создаём экран нового виджета, то не используем
    func setWidget() {
        
    }
    
    //MARK: Methods for view
    func openTypeBottomSheet() {
        print(#function)
    }
    
    func openBackgroundBottomSheet() {
        print(#function)
    }
    
    func openStyleBottomSheet() {
        print(#function)
    }
    
    func saveWidget() {
        print(#function)
    }
}
