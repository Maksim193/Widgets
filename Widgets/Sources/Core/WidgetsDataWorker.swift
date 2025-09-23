//
//  WidgetsDataWorker.swift
//  Widgets
//
//  Created by Максим Косников on 27.03.2025.
//

import SwiftUI

protocol WidgetsDataWorkerProtocol {
	func getWidgetsPreviewData() -> [WidgetPreviewModel]
	func saveWidget(_ widget: WidgetPreviewModel)
}

final class WidgetsDataWorker {
	private let repository: RepositoryProtocol
	
	init(
		repository: RepositoryProtocol
	) {
		self.repository = repository
	}
}

// MARK: - WidgetsDataWorkerProtocol

extension WidgetsDataWorker: WidgetsDataWorkerProtocol {
	func getWidgetsPreviewData() -> [WidgetPreviewModel] {
		let widgets = self.repository.getWidgetsData()
		return widgets.map {
			WidgetPreviewModel(
				id: $0.id,
				name: $0.name,
				type: self.mapWidgetPreviewType($0.type)
			)
		}
	}
	
	func saveWidget(_ widget: WidgetPreviewModel) {
		let widgetModel = WidgetModel(
			id: widget.id,
			name: widget.name,
			type: self.mapWidgetType(widget.type)
		)
		self.repository.saveWidget(widgetModel)
	}
}

// MARK: - Map methods

extension WidgetsDataWorker {
	private func mapWidgetPreviewType(_ type: WidgetType) -> WidgetPreviewType {
		switch type {
		case .example:
			return .example
		case .digitalClock(let digitalClockModel):
			let digitalClockPreviewModel = self.mapDigitalClockPreviewType(digitalClockModel)
			return .digitalClock(digitalClockPreviewModel)
		}
	}
	
	private func mapDigitalClockPreviewType(
		_ model: DigitalClockWidgetModel
	) -> DigitalClockWidgetPreviewModel {
		let backgroundImage = UIImage(data: model.backgroundImage)
		let font = self.mapDigitalClockPreviewFont(model.font)
		let backgroundColor = Color(hex: model.backgroundColorHEX)
		let foregroundColor = Color(hex: model.foregroundColorHEX)
		return DigitalClockWidgetPreviewModel(
			backgroundImage: backgroundImage,
			backgroundColor: backgroundColor,
			foregroundColor: foregroundColor,
			font: font
		)
	}
	
	private func mapDigitalClockPreviewFont(
		_ fontString: String
	) -> DigitalClockWidgetPreviewModel.ClockWidgetFont {
		switch fontString {
		case "Montserrat":
			return .montserrat
		case "Michroma":
			return .michroma
		case "StickNoBills":
			return .stickNoBills
		case "DotGothic16":
			return .dotGothic16
		case "RalewayDots":
			return .ralewayDots
		case "SFPro":
			return .SFPro
		default: return .SFPro
		}
	}
	
	private func mapWidgetType(_ type: WidgetPreviewType) -> WidgetType {
		switch type {
		case .example:
			return .example
		case .digitalClock(let digitalClockPreviewModel):
			let backgroundImageData = digitalClockPreviewModel.backgroundImage?.jpegData(compressionQuality: 1) ?? Data()
			let font = self.mapDigitalClockFont(digitalClockPreviewModel.font)
			let backgroundColorHEX = digitalClockPreviewModel.backgroundColor.toHEX()
			let foregroundColorHEX = digitalClockPreviewModel.foregroundColor.toHEX()
			let digitalClockModel = DigitalClockWidgetModel(
				backgroundImage: backgroundImageData,
				backgroundColorHEX: backgroundColorHEX,
				foregroundColorHEX: foregroundColorHEX,
				font: font
			)
			return .digitalClock(digitalClockModel)
		}
	}
	
	private func mapDigitalClockFont(
		_ font: DigitalClockWidgetPreviewModel.ClockWidgetFont
	) -> String {
		switch font {
		case .montserrat:
			return "Montserrat"
		case .michroma:
			return "Michroma"
		case .stickNoBills:
			return "StickNoBills"
		case .dotGothic16:
			return "DotGothic16"
		case .ralewayDots:
			return "RalewayDots"
		case .SFPro:
			return "SFPro"
		}
	}
}
