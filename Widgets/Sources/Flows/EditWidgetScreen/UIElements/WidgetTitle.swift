//
//  WidgetTitle.swift
//  Widgets
//
//  Created by Максим Косников on 07.01.2025.
//

import SwiftUI

struct WidgetTitle: View {
	@State var title = ""
	
	@State private var dummyText = ""
	@State private var isPresentedCharLimitAlert = false
	@FocusState private var isDummyTextFieldFocused: Bool
	@FocusState private var isTextFieldFocused: Bool
	
	var body: some View {
		titleView
		.onTapGesture {
			titleDidTap()
		}
		.background {
			dummyTextField
		}
		.toolbar {
			ToolbarItem(placement: .keyboard) {
				toolbarTextField
			}
		}
		.alert(isPresented: $isPresentedCharLimitAlert) {
			Alert(title: Text("Минимум 2 символа"))
		}
	}
	
	var titleView: some View {
		HStack {
			Text(title)
			Image(systemName: "square.and.pencil")
		}
		.font(.title3)
		.background {
			Color(.lightGray)
				.cornerRadius(16)
				.padding(-10)
				.opacity(0.2)
		}
		.frame(maxWidth: 300)
	}
	
	var dummyTextField: some View {
		TextField("", text: $dummyText)
			.focused($isDummyTextFieldFocused)
			.opacity(.zero)
			.onChange(of: isTextFieldFocused) {
				if !isTextFieldFocused {
					isDummyTextFieldFocused = false
				}
			}
	}
	
	var toolbarTextField: some View {
		TextField(title, text: $dummyText)
			.textFieldStyle(.plain)
			.focused($isTextFieldFocused)
			.onSubmit {
				guard validateEnteredTitle() else {
					isPresentedCharLimitAlert.toggle()
					return
				}
				changeText()
			}
			.onAppear {
				toolbarDidAppear()
			}
	}
	
	private func titleDidTap() {
		dummyText = title
		isDummyTextFieldFocused = true
	}
	
	private func toolbarDidAppear() {
		isTextFieldFocused = true
	}
	
	private func validateEnteredTitle() -> Bool {
		return dummyText.trimmingCharacters(in: .whitespacesAndNewlines).count < 2
	}
	
	private func changeText() {
		withAnimation {
			title = dummyText
		}
		isTextFieldFocused = false
	}
}

#Preview {
	EditWidgetView(viewModel: .init())
}
