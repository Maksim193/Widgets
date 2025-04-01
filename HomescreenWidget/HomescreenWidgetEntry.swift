//
//  HomescreenWidgetEntry.swift
//  WidgetExtension
//
//  Created by Максим Косников on 10.02.2025.
//

import SwiftUI
import WidgetKit

struct HomescreenWidgetEntry: TimelineEntry {
	var date: Date
	let type: EntryType
	
	enum EntryType {
		case example
		case digitalClock(DigitalClockWidgetEntry)
	}
}

struct DigitalClockWidgetEntry {
	let date: Date
	let backgroundColor: Color
	let foregroundColor: Color
	let image: UIImage?
	let font: Font?
}
