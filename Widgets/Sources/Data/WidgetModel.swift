//
//  WidgetModel.swift
//  WidgetExtension
//
//  Created by Максим Косников on 27.01.2025.
//

import Foundation
import SwiftData

@Model
public class WidgetModel {
	@Attribute(.unique) public var id: String
	public var name: String
	
	public init(name: String) {
		self.id = UUID().uuidString
		self.name = name
	}
}
