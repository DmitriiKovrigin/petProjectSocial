//
//  UserView.swift
//  petProjectSocial
//
//  Created by Dima Kovrigin on 06.06.2024.
//
import SwiftUI

struct UserView: View {
    @ObservedObject var coordinator: Coordinator
    @State private var showImagePicker: Bool = false
    @State private var inputImage: UIImage?

    var body: some View {
        VStack {
            HStack {
                Spacer()
                Button(action: {
                    coordinator.isEditing.toggle()
                }) {
                    Image(systemName: "pencil")
                        .font(.title)
                        .padding()
                }
            }
            .padding(.trailing)
            
            coordinator.userImage
                .resizable()
                .scaledToFill()  // Изменяем scaledToFit на scaledToFill для корректного заполнения круга
                .frame(width: 200, height: 200)
                .clipShape(Circle())
                .clipped()  // Удостоверяемся, что изображение обрезается по кругу
                .padding(.top, -30)
                .onTapGesture {
                    showImagePicker = true
                }

            Button("Select Profile Picture") {
                showImagePicker = true
            }
            .padding(.bottom, 20)

            if coordinator.isEditing {
                VStack(alignment: .leading) {
                    Text("Personal Information")
                        .font(.headline)
                        .padding(.bottom, 5)

                    Group {
                        HStack {
                            Text("First Name:")
                            TextField("First Name", text: $coordinator.firstName)
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                        }
                        HStack {
                            Text("Last Name:")
                            TextField("Last Name", text: $coordinator.lastName)
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                        }
                        HStack {
                            Text("Age:")
                            TextField("Age", text: $coordinator.age)
                                .keyboardType(.numberPad)
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                        }
                        HStack {
                            Text("Email:")
                            TextField("Email", text: $coordinator.email)
                                .keyboardType(.emailAddress)
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                        }
                    }
                    .padding(.leading, 16)
                }
                .padding(.horizontal)
                .frame(maxWidth: .infinity, alignment: .leading)
            } else {
                VStack(alignment: .leading, spacing: 10) {
                    HStack {
                        Text("First Name: ")
                            .fontWeight(.bold)
                        Text(coordinator.firstName)
                    }
                    HStack {
                        Text("Last Name: ")
                            .fontWeight(.bold)
                        Text(coordinator.lastName)
                    }
                    HStack {
                        Text("Age: ")
                            .fontWeight(.bold)
                        Text(coordinator.age)
                    }
                    HStack {
                        Text("Email: ")
                            .fontWeight(.bold)
                        Text(coordinator.email)
                    }
                }
                .padding(.leading, 16)
                .font(.body)
                .frame(maxWidth: .infinity, alignment: .leading)
            }
            
            Spacer()
        }
        .sheet(isPresented: $showImagePicker, onDismiss: loadImage) {
            ImagePicker(selectedImage: $inputImage)
        }
    }

    func loadImage() {
        guard let inputImage = inputImage else { return }
        let circularImage = Image(uiImage: inputImage)
        coordinator.userImage = circularImage
    }
}
