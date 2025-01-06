//
//  EditWidgetButtons.swift
//  Widgets
//
//  Created by Максим Косников on 07.01.2025.
//

import SwiftUI

struct EditWidgetButtons: View {
	let editWidgetButtonsModel: [EditWidgetModel.EditWidgetButtonModel]
	
	var body: some View {
		HStack {
			ForEach(editWidgetButtonsModel, id: \.self) { model in
				Button {
					print()
				} label: {
					VStack {
						ZStack {
							Color(.gray)
								.cornerRadius(16)
								.opacity(0.2)
							Image(systemName: model.image)
								.font(.largeTitle)
						}
						.frame(width: 90, height: 70)
						Text(LocalizedStringResource(stringLiteral: model.title))
							.font(.footnote)
					}
					.foregroundStyle(.black)
				}
			}
		}
	}
}
