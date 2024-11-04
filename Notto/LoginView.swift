//
//  LoginView.swift
//  Notto
//
//  Created by Mykhailo Kravchuk on 22/10/2024.
//

import SwiftUI

struct LoginView: View {
    @EnvironmentObject var appViewModel: AppViewModel
    @State private var username = ""
    @State private var password = ""
    @State private var showRegisterView = false // Для переходу на RegisterView
    
    var body: some View {
        NavigationStack {
            VStack {
                Spacer()
                
                TextField("Username", text: $username)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                    .textInputAutocapitalization(.never)
                
                SecureField("Password", text: $password)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                    .textInputAutocapitalization(.never)
                
                Button("Sign In") {
                    appViewModel.login(username: username, password: password)
                }
                .padding()
                .background(Color.blue)
                .foregroundColor(.white)
                .cornerRadius(8)
                
                Spacer()
                
                HStack {
                    Text("Don't have an account?")
                    
                    // Використання NavigationLink з новим синтаксисом
                    NavigationLink("Sign up", destination: RegisterView())
                        .foregroundColor(.blue)
                }
                .padding()
            }
            .padding()
            .navigationTitle("Login") // Додаємо заголовок
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}


struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}



