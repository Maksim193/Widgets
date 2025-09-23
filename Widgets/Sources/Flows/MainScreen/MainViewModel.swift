//
//  MainViewModel.swift
//  Widgets
//
//  Created by Николай Чунихин on 06.01.2025.
//

import Combine
import SwiftUI

final class MainViewModel: ObservableObject {
	
	// MARK: - Dependencies
	
	private let widgetsDataWorker: WidgetsDataWorkerProtocol
	
    // MARK: - Publishers
    @Published var isEditViewOpened = false
    @Published var isCreateViewOpened = false
    @Published var previewWidgets: [WidgetPreviewModel] = []
    
    // MARK: - Init
    init(
		widgetsDataWorker: WidgetsDataWorkerProtocol
	) {
		self.widgetsDataWorker = widgetsDataWorker
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
}

extension MainViewModel {
	
	// MARK: - Internal methods
	
    func viewIsReady() {
		self.previewWidgets = self.widgetsDataWorker.getWidgetsPreviewData()
    }
}
