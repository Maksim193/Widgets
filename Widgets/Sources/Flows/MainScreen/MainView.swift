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
            Rectangle()
                .fill(
                    LinearGradient(
                        gradient: Gradient(colors: [.purple, .pink.opacity(0.2), .white]),
                        startPoint: .top,
                        endPoint: .bottom
                    )
                )
                .ignoresSafeArea(.all)
            
            //MARK: main content
            VStack {
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
                .navigationDestination(isPresented: $viewModel.isEditViewOpen) {
                    EditWidgetView(viewModel: .init())
                }
            }
            
            VStack {
                HStack {
                    Text("My widgets")
                        .font(.system(size: 28, weight: .bold))
                        .padding(.leading, 15)
                    Spacer()
                    CreateButton(action: {
                        viewModel.routeCreateWidget()
                    })
                    .navigationDestination(isPresented: $viewModel.isCreateViewOpen) {
                        EditWidgetView(viewModel: .init())
                    }
                }
                .background(Material.ultraThin)
                Spacer()
            }
            
            
            //MARK: advert
//            VStack {
//                Spacer()
//                AdvertView {
//                    viewModel.routerAdvertisement()
//                }
//            }
        }
    }
}

#Preview {
    NavigationStack {
        MainView(viewModel: .init())
    }
}
