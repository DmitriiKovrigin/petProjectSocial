//
//  ContentView.swift
//  petProjectSocial
//
//  Created by Dima Kovrigin on 05.06.2024.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var coordinator = Coordinator()

    var body: some View {
        VStack {
            Spacer()
            ZStack {
                switch coordinator.selectedTab {
                case 0:
                    PhotoGalleryView()
                case 1:
                    UserView(userImage: $coordinator.userImage)
                case 2:
                    SettingsView()
                default:
                    UserView(userImage: $coordinator.userImage)
                }
            }
            Spacer()
            CustomTabBar(coordinator: coordinator)
        }
    }
}

#Preview {
    ContentView()
}
