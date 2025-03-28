//
//  WidgetPreviewModel.swift
//  Widgets
//
//  Created by Николай Чунихин on 08.01.2025.
//

import Foundation
import SwiftUI

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
	let backgroundColor: Color
	let foregroundColor: Color
	let font: ClockWidgetFont
	
	enum ClockWidgetFont {
		case montserrat
		case michroma
		case stickNoBills
		case dotGothic16
		case ralewayDots
		case SFPro
		
		var value: Font {
			switch self {
			case .montserrat:
				return .custom("Montserrat-Regular", size: 40)
			case .michroma:
				return .custom("Michroma-Regular", size: 24)
			case .stickNoBills:
				return .custom("StickNoBills-Regular", size: 48)
			case .dotGothic16:
				return .custom("DotGothic16-Regular", size: 40)
			case .ralewayDots:
				return .custom("RalewayDots-Regular", size: 48)
			case .SFPro:
				return .system(size: 40)
			}
		}
	}
}
