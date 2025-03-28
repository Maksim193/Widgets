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
			backgroundColor: .black,
			foregroundColor: .black,
			font: .SFPro
		)
		let widgetModel = WidgetPreviewModel(id: "", name: "SFPro", type: .digitalClock(digitalClock))
		self.widgetsDataWorker.saveWidget(widgetModel)
		let digitalClock1 = DigitalClockWidgetPreviewModel(
			backgroundImage: nil,
			backgroundColor: .black,
			foregroundColor: .black,
			font: .dotGothic16
		)
		let widgetModel1 = WidgetPreviewModel(id: "", name: "DotGothic16", type: .digitalClock(digitalClock1))
		self.widgetsDataWorker.saveWidget(widgetModel1)
		let digitalClock2 = DigitalClockWidgetPreviewModel(
			backgroundImage: nil,
			backgroundColor: .black,
			foregroundColor: .black,
			font: .dotGothic16
		)
		let widgetModel2 = WidgetPreviewModel(id: "", name: "DotGothic16", type: .digitalClock(digitalClock2))
		self.widgetsDataWorker.saveWidget(widgetModel2)
		let digitalClock3 = DigitalClockWidgetPreviewModel(
			backgroundImage: nil,
			backgroundColor: .black,
			foregroundColor: .black,
			font: .michroma
		)
		let widgetModel3 = WidgetPreviewModel(id: "", name: "Michroma", type: .digitalClock(digitalClock3))
		self.widgetsDataWorker.saveWidget(widgetModel3)
		let digitalClock4 = DigitalClockWidgetPreviewModel(
			backgroundImage: nil,
			backgroundColor: .black,
			foregroundColor: .black,
			font: .montserrat
		)
		let widgetModel4 = WidgetPreviewModel(id: "", name: "Montsertat", type: .digitalClock(digitalClock4))
		self.widgetsDataWorker.saveWidget(widgetModel4)
		let digitalClock5 = DigitalClockWidgetPreviewModel(
			backgroundImage: nil,
			backgroundColor: .black,
			foregroundColor: .black,
			font: .ralewayDots
		)
		let widgetModel5 = WidgetPreviewModel(id: "", name: "RalewayDots", type: .digitalClock(digitalClock5))
		self.widgetsDataWorker.saveWidget(widgetModel5)
		let digitalClock6 = DigitalClockWidgetPreviewModel(
			backgroundImage: nil,
			backgroundColor: .black,
			foregroundColor: .black,
			font: .stickNoBills
		)
		let widgetModel6 = WidgetPreviewModel(id: "", name: "StickNoBills", type: .digitalClock(digitalClock6))
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
