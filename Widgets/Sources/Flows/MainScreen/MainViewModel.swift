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
    // MARK: - Publishers
    @Published var isEditViewOpened = false
    @Published var isCreateViewOpened = false
    @Published var previewWidgets: [WidgetPreviewModel] = []
    
    // MARK: - Init
    init() {
        getWidgets()
    }
    
    // MARK: - Actions
    func routeEditWidget() {
        isEditViewOpened = true
    }
    
    func routeCreateWidget() {
        isCreateViewOpened = true
    }
    
    func routerAdvertisement() {
        print(#function)
    }
	
	// MARK: - Map methods
	
	private func mapWidgetType(_ type: WidgetType) -> WidgetPreviewType {
		switch type {
		case .example:
			return .example
		case .digitalClock(let digitalClockModel):
			let digitalClockPreviewModel = self.mapDigitalClockType(digitalClockModel)
			return .digitalClock(digitalClockPreviewModel)
		}
	}
	
	private func mapDigitalClockType(_ model: DigitalClockWidgetModel) -> DigitalClockWidgetPreviewModel {
		let backgroundImage = UIImage(data: model.backgroundImage)
		return DigitalClockWidgetPreviewModel(
			backgroundImage: backgroundImage,
			font: model.font
		)
	}
}

extension MainViewModel {
	
	// MARK: - Internal methods
	
    func getWidgets() {
		let modelContainer = try! ModelContainer(for: WidgetModel.self)
		let modelContext = ModelContext(modelContainer)
		let widgets = try! modelContext.fetch(FetchDescriptor<WidgetModel>())
		self.previewWidgets = widgets.map {
			WidgetPreviewModel(
				id: $0.id,
				name: $0.name,
				type: self.mapWidgetType($0.type)
			)
		}
    }
}
