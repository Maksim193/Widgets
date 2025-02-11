//
//  WidgetNameKeyboardView.swift
//  Widgets
//
//  Created by Максим Косников on 11.02.2025.
//

import SwiftUI

struct WidgetNameKeyboardView: View {
  @State private var text = ""
  @State private var items: [String] = []
  @FocusState private var isHiddenTextFieldFocused: Bool
  @FocusState private var isTextFieldFocused: Bool
  
  @State private var dummyText: String = ""
  var body: some View {
	VStack {
	  Button("Show Keyboard") {
		isHiddenTextFieldFocused = true
	  }
	  
	  List(items, id: \.self) { item in
		Text(item)
	  }
	}
	.background {
	  TextField("", text: $dummyText)
		.focused($isHiddenTextFieldFocused)
		.frame(width: 0, height: 0)
		.opacity(0)
		.onChange(of: isTextFieldFocused) {
		  if !isTextFieldFocused {
			isHiddenTextFieldFocused = false
		  }
		}
	}
	.toolbar {
	  ToolbarItem(placement: .keyboard) {
		HStack {
		  Button("Done") {
			items.append(text)
			text = ""
		  }
		  TextField("item name", text: $text)
			.textFieldStyle(RoundedBorderTextFieldStyle())
			.focused($isTextFieldFocused)
			.onSubmit {
			  items.append(text)
			  text = ""
			  isTextFieldFocused = false
			}
		}
		.onAppear {
		  isTextFieldFocused = true
		}
	  }
	}
  }
}

#Preview {
	WidgetNameKeyboardView()
}
