//
//  EditWidgetViewModel.swift
//  Widgets
//
//  Created by Максим Косников on 06.01.2025.
//

import CoreFoundation
import Combine
import UIKit

final class EditWidgetViewModel: ObservableObject {
	@Published var widgetTitle: String = "Виджет 1"
	let editWidgetButtons: [EditWidgetModel.EditWidgetButtonModel] = [
		EditWidgetModel.EditWidgetButtonModel(image: "rectangle.3.group", title: "Тип виджета"),
		EditWidgetModel.EditWidgetButtonModel(image: "photo", title: "Фото виджета"),
		EditWidgetModel.EditWidgetButtonModel(image: "paintpalette", title: "Цвет виджета")
	]
}
