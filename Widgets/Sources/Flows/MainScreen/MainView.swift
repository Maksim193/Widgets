//
//  MainView.swift
//  Widgets
//
//  Created by Николай Чунихин on 06.01.2025.
//

import SwiftUI

struct MainView: View {
    /// viewModel типа MainViewModel
    @StateObject var viewModel: MainViewModel
    
    //MARK: body
    var body: some View {
        ZStack {
            //MARK: Background
            GradientBackground()
                .ignoresSafeArea(.all)
            
            //MARK: Collection
            ScrollView {
                LazyVStack(spacing: 15) {
                    ForEach(viewModel.widgets) { widget in
                        WidgetRowView(widget: widget)
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
                EditWidgetView(viewModel: .init())
            }
        }
    }
}

#Preview {
    NavigationStack {
        MainView(viewModel: .init())
    }
}
