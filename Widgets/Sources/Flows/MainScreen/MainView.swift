//
//  MainView.swift
//  Widgets
//
//  Created by Николай Чунихин on 06.01.2025.
//

import SwiftUI
import SwiftData

struct MainView: View {
    /// viewModel типа MainViewModel
    @StateObject var viewModel: MainViewModel

    //MARK: body
    var body: some View {
        //MARK: Background
        BackgroundView(colors: [
            Color(.mainApp),
            Color(.mainApp),
            Color(.backgroundSecondary)
        ]) {
            ZStack {
                //MARK: Collection
                ScrollView {
                    LazyVStack(spacing: 15) {
                        ForEach(viewModel.previewWidgets) { widgetModel in
                            WidgetRowView(widgetModel: widgetModel)
                                .onTapGesture {
                                    viewModel.routeEditWidget()
                                }
                        }
                    }
                    .padding(.top, 95)
                }
                .scrollIndicators(.hidden)
                .navigationDestination(isPresented: $viewModel.isEditViewOpened) {
                    EditWidgetView(viewModel: .init())
                }
                
                //MARK: Header
                HeaderView {
                    viewModel.routeCreateWidget()
                }
                .navigationDestination(isPresented: $viewModel.isCreateViewOpened) {
                    EditWidgetFlowFactory.make()
                }
            }
        }
		.onAppear {
			viewModel.viewIsReady()
		}
    }
}

#Preview {
	let widgetsDataWorker = WidgetsDataWorker(repository: Repository())
    NavigationStack {
		MainView(viewModel: .init(widgetsDataWorker: widgetsDataWorker))
    }
}
