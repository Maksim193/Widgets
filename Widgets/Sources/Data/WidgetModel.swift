//
//  WidgetModel.swift
//  WidgetExtension
//
//  Created by Максим Косников on 27.01.2025.
//

import Foundation
import SwiftData

@Model
class WidgetModel {
	@Attribute(.unique) var id: String
	var name: String
	var type: WidgetType
	
	init(
		name: String,
		type: WidgetType
	) {
		self.id = UUID().uuidString
		self.name = name
		self.type = type
	}
}

enum WidgetType: Codable {
	case example
	case digitalClock(DigitalClockWidgetModel)
}

struct DigitalClockWidgetModel: Codable {
	let backgroundImage: Data
	let font: String
}
