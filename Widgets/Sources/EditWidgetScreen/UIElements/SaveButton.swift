//
//  SaveButton.swift
//  Widgets
//
//  Created by Максим Косников on 07.01.2025.
//

import SwiftUI

struct SaveButton: View {
	var body: some View {
		Button {
			
		} label: {
			ZStack {
				Color(.black)
					.cornerRadius(16)
					.frame(height: 60)
					.padding([.leading, .trailing])
				Text("EditWidgetView.SaveButton")
					.font(.headline)
					.foregroundStyle(.white)
			}
		}
	}
}
