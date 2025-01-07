//
//  MainView.swift
//  Widgets
//
//  Created by Николай Чунихин on 06.01.2025.
//

import SwiftUI

struct MainView: View {
    
    @StateObject var viewModel: MainViewModel
    
    var body: some View {
        ZStack {
            Color(.white)
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
                        WidgetView(type: .medium)
                        Text("widget 1")
                        
                        WidgetView(type: .medium)
                        Text("widget 2")
                    }
                }
                Spacer()
            }
            VStack {
                Spacer()
                Button {
                    
                } label: {
                    VStack {
                        Text("Скачай справочник СПЗ")
                            .font(
                                .system(
                                    size: 27,
                                    weight: .semibold,
                                    design: .rounded
                                )
                            )
                            .padding(.bottom)
                        HStack {
                            Text("erid: xxxxx")
                            Spacer()
                        }
                    }
                    .foregroundColor(.white)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.orange)
                    .cornerRadius(20)
                    .padding(.horizontal, 20)
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
