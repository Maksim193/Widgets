//
//  EditWidgetViewModel.swift
//  Widgets
//
//  Created by Максим Косников on 06.01.2025.
//

import Combine

final class EditWidgetViewModel: ObservableObject {
	@Published var widgetTitle: String = "Виджет 1"
	let editWidgetButtons: [EditWidgetModel.EditWidgetButtonModel] = [
		EditWidgetModel.EditWidgetButtonModel(image: "rectangle.3.group", title: "EditWidgetView.changeButton.type"),
		EditWidgetModel.EditWidgetButtonModel(image: "photo", title: "EditWidgetView.changeButton.image"),
		EditWidgetModel.EditWidgetButtonModel(image: "paintpalette", title: "EditWidgetView.changeButton.color")
	]
}
