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
        NavigationView {
            VStack {
                Spacer()
                ZStack {
                    switch coordinator.selectedTab {
                    case 0:
                        PhotoGalleryView()
                    case 1:
                        UserView(coordinator: coordinator)
                    case 2:
                        SettingsView()
                    default:
                        UserView(coordinator: coordinator)
                    }
                }
                Spacer()
                CustomTabBar(coordinator: coordinator)
            }
        }
    }
}



#Preview {
    ContentView()
}
