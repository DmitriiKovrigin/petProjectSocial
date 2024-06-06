//
//  TabBarButton.swift
//  petProjectSocial
//
//  Created by Dima Kovrigin on 06.06.2024.
//

import SwiftUI

struct TabBarButton: View {
    let systemIconName: String
    @Binding var selectedTab: Int
    let tab: Int

    var body: some View {
        Button(action: {
            selectedTab = tab
        }) {
            Image(systemName: systemIconName)
                .font(.system(size: 24))
                .foregroundColor(selectedTab == tab ? .blue : .gray)
                .padding()
        }
    }
}

