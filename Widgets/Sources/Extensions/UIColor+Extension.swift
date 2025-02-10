//
//  UIColor+Extension.swift
//  WidgetExtension
//
//  Created by Максим Косников on 10.02.2025.
//

import UIKit

extension UIColor {
	public func named(_ name: String) -> UIColor? {
		let allColors: [String: UIColor] = [
			"red": .red,
			"black": .black,
			"green": .green,
			"purple": .purple
		]
		let cleanedName = name.replacingOccurrences(of: " ", with: "").lowercased()
		return allColors[cleanedName]
	}
}
