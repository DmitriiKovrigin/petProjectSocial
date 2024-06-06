//
//  UserView.swift
//  petProjectSocial
//
//  Created by Dima Kovrigin on 06.06.2024.
//

import SwiftUI

struct UserView: View {
    @Binding var userImage: Image

    var body: some View {
        VStack {
            Text("User View")
                .font(.largeTitle)
            userImage
                .resizable()
                .scaledToFit()
                .frame(width: 100, height: 100)
                .clipShape(Circle())
                .padding()
        }
    }
}
