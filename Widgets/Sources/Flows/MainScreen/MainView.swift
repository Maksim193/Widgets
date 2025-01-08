//
//  MainView.swift
//  Widgets
//
//  Created by Николай Чунихин on 06.01.2025.
//

import SwiftUI

struct MainView: View {
    /// viewModel
    @StateObject var viewModel: MainViewModel
    
    //MARK: body
    var body: some View {
        ZStack {
            //MARK: background
            Color(.white)
            
            //MARK: main content
            VStack {
                HStack {
                    Spacer()
                    CreateButton(action: {
                        viewModel.routeCreateWidget()
                    })
                    .navigationDestination(isPresented: $viewModel.isCreateViewOpen) {
                        EditWidgetView(viewModel: .init())
                    }
                }
                
                
                ScrollView {
                    LazyVStack(spacing: 15) {
                        ForEach(viewModel.widgets) { widget in
                            WidgetRowView(widget: widget)
                                .onTapGesture {
                                    viewModel.routeEditWidget()
                                }
                        }                        
                    }
                    
                }
                .navigationDestination(isPresented: $viewModel.isEditViewOpen) {
                    EditWidgetView(viewModel: .init())
                }
            }
            
            //MARK: advert
            VStack {
                Spacer()
                AdvertView {
                    viewModel.routerAdvertisement()
                }
            }
        }
    }
}

#Preview {
    NavigationStack {
        MainView(viewModel: .init())
    }
}
