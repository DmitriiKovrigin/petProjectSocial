//
//  Coordinator.swift
//  petProjectSocial
//
//  Created by Dima Kovrigin on 06.06.2024.
//

import SwiftUI


class Coordinator: ObservableObject {
    @Published var selectedTab: Int = 1
    @Published var userImage: Image = Image(systemName: "person.circle.fill")
    
    // Добавить методы для обработки навигации или других логик
}

