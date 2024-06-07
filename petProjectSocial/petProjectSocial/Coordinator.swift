//
//  Coordinator.swift
//  petProjectSocial
//
//  Created by Dima Kovrigin on 06.06.2024.
//

import SwiftUI
import UIKit

class Coordinator: ObservableObject {
    @Published var selectedTab: Int = 1
    @Published var userImage: Image = Image(systemName: "person.circle.fill")
    @Published var firstName: String = ""
    @Published var lastName: String = ""
    @Published var age: String = ""
    @Published var email: String = ""
    @Published var isEditing: Bool = false
}
