//
//  HomescreenWidgetEntry.swift
//  WidgetExtension
//
//  Created by Максим Косников on 10.02.2025.
//

import SwiftUI
import WidgetKit

struct HomescreenWidgetEntry: TimelineEntry {
	let date: Date
	let backgroundColor: Color
	let foregroundColor: Color
	let image: UIImage?
	let font: Font?
}
