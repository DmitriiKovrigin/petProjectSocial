//
//  CustomTabBar.swift
//  petProjectSocial
//
//  Created by Dima Kovrigin on 06.06.2024.
//

import SwiftUI

struct CustomTabBar: View {
    @ObservedObject var coordinator: Coordinator

    var body: some View {
        HStack {
            TabBarButton(systemIconName: "photo.on.rectangle", selectedTab: $coordinator.selectedTab, tab: 0)
            Spacer()
            Button(action: {
                coordinator.selectedTab = 1
            }) {
                coordinator.userImage
                    .resizable()
                    .scaledToFill()  // Изменяем scaledToFit на scaledToFill для корректного заполнения круга
                    .frame(width: 50, height: 50)
                    .clipShape(Circle())
                    .clipped()  // Удостоверяемся, что изображение обрезается по кругу
                    .shadow(radius: 5)
            }
            Spacer()
            TabBarButton(systemIconName: "gearshape.fill", selectedTab: $coordinator.selectedTab, tab: 2)
        }
        .padding(.horizontal)
        .padding(.bottom, 10)
        .background(Color.white.shadow(radius: 2))
    }
}


