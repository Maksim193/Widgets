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
//        isCreateViewOpened = true
		let digitalClock = DigitalClockWidgetPreviewModel(
			backgroundImage: nil,
			backgroundColor: .red,
			foregroundColor: .purple,
			font: .SFPro
		)
		let widgetModel = WidgetPreviewModel(id: "", name: "SFPro", type: .digitalClock(digitalClock))
		self.widgetsDataWorker.saveWidget(widgetModel)
		let digitalClock1 = DigitalClockWidgetPreviewModel(
			backgroundImage: nil,
			backgroundColor: .green,
			foregroundColor: .black,
			font: .dotGothic16
		)
		let widgetModel1 = WidgetPreviewModel(id: "1", name: "DotGothic16", type: .digitalClock(digitalClock1))
		self.widgetsDataWorker.saveWidget(widgetModel1)
		let digitalClock3 = DigitalClockWidgetPreviewModel(
			backgroundImage: nil,
			backgroundColor: .pink,
			foregroundColor: .white,
			font: .michroma
		)
		let widgetModel3 = WidgetPreviewModel(id: "3", name: "Michroma", type: .digitalClock(digitalClock3))
		self.widgetsDataWorker.saveWidget(widgetModel3)
		let digitalClock4 = DigitalClockWidgetPreviewModel(
			backgroundImage: nil,
			backgroundColor: .brown,
			foregroundColor: .white,
			font: .montserrat
		)
		let widgetModel4 = WidgetPreviewModel(id: "4", name: "Montsertat", type: .digitalClock(digitalClock4))
		self.widgetsDataWorker.saveWidget(widgetModel4)
		let digitalClock5 = DigitalClockWidgetPreviewModel(
			backgroundImage: nil,
			backgroundColor: .cyan,
			foregroundColor: .blue,
			font: .ralewayDots
		)
		let widgetModel5 = WidgetPreviewModel(id: "5", name: "RalewayDots", type: .digitalClock(digitalClock5))
		self.widgetsDataWorker.saveWidget(widgetModel5)
		let digitalClock6 = DigitalClockWidgetPreviewModel(
			backgroundImage: nil,
			backgroundColor: .black,
			foregroundColor: .white,
			font: .stickNoBills
		)
		let widgetModel6 = WidgetPreviewModel(id: "6", name: "StickNoBills", type: .digitalClock(digitalClock6))
		self.widgetsDataWorker.saveWidget(widgetModel6)
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
