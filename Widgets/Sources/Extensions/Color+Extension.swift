//
//  Color+Extension.swift
//  WidgetExtension
//
//  Created by Максим Косников on 10.02.2025.
//

import SwiftUI

extension Color {
	init(hex: UInt, alpha: Double = 1) {
		self.init(
			.sRGB,
			red: Double((hex >> 16) & 0xff) / 255,
			green: Double((hex >> 08) & 0xff) / 255,
			blue: Double((hex >> 00) & 0xff) / 255,
			opacity: alpha
		)
	}
	
	func toHEX() -> UInt {
		guard let components = UIColor(self).cgColor.components,
			  components.count >= 3 else { return .zero }
		
		let redColor = UInt(components[0] * 255) << 16
		let greenColor = UInt(components[1] * 255) << 8
		let blueColor = UInt(components[2] * 255)
		
		return redColor + greenColor + blueColor
	}
}
