//
//  Widget.swift
//  Widgets
//
//  Created by Николай Чунихин on 08.01.2025.
//

import Foundation

struct Widget: Identifiable, Codable {
    let id: String
    let title: String
    
    init(id: String = UUID().uuidString, title: String) {
        self.id = id
        self.title = title
    }
}
