//
//  WidgetPreviewModel.swift
//  Widgets
//
//  Created by Николай Чунихин on 08.01.2025.
//

import Foundation
import UIKit

struct WidgetPreviewModel: Identifiable {
	let id: String
	var name: String
	var type: WidgetPreviewType
	
	init(
		id: String,
		name: String,
		type: WidgetPreviewType
	) {
		self.id = id
		self.name = name
		self.type = type
	}
}

enum WidgetPreviewType {
	case example
	case digitalClock(DigitalClockWidgetPreviewModel)
}

struct DigitalClockWidgetPreviewModel {
	let backgroundImage: UIImage?
	let font: String
}
