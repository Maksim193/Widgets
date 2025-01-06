//
//  EditWidgetView.swift
//  Widgets
//
//  Created by Максим Косников on 06.01.2025.
//

import SwiftUI

struct EditWidgetView: View {
	@StateObject var viewModel: EditWidgetViewModel
	
	var body: some View {
		VStack {
			Spacer(minLength: 32)
			widgetTitle
			WidgetsPageView()
			Text("Изменить виджет")
				.font(.headline)
			editWidgetButtons
			Spacer(minLength: 32)
			saveButton
		}
	}
	
	var widgetTitle: some View {
		HStack {
			Text(viewModel.widgetTitle)
			Image(systemName: "square.and.pencil")
		}
		.font(.title3)
		.background(alignment: .center) {
			Color(.lightGray)
				.cornerRadius(16)
				.padding(-10)
				.opacity(0.2)
		}
	}
	
	var editWidgetButtons: some View {
		HStack {
			ForEach(viewModel.editWidgetButtons, id: \.self) { model in
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
						Text(model.title)
							.font(.footnote)
					}
					.foregroundStyle(.black)
				}
			}
		}
	}
	
	var saveButton: some View {
		Button {
			
		} label: {
			ZStack {
				Color(.black)
					.cornerRadius(16)
					.frame(height: 60)
					.padding([.leading, .trailing])
				Text("Сохранить")
					.font(.headline)
					.foregroundStyle(.white)
			}
		}
	}
}

#Preview {
	EditWidgetView(viewModel: EditWidgetViewModel())
}
