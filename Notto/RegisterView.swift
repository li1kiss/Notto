//
//  RegisterView.swift
//  Notto
//
//  Created by Mykhailo Kravchuk on 03/11/2024.
//

import SwiftUI

struct RegisterView: View {
    @State private var email = ""
    @State private var password = ""
    @State private var registrationSuccess = false // Змінна для повідомлення про успіх
    @EnvironmentObject var appViewModel: AppViewModel
    @Environment(\.presentationMode) var presentationMode // Для закриття RegisterView
    
    var body: some View {
        VStack {
            Text("Register")
                .font(.largeTitle)
                .padding()
            
            TextField("Email", text: $email)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
                .textInputAutocapitalization(.never)
            
            SecureField("Password", text: $password)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
                .textInputAutocapitalization(.never)
            
            Button("Sign Up") {
                appViewModel.register(email: email, password: password) { success, message in
                    if success {
                        registrationSuccess = true
                    } else {
                        print("Registration failed: \(message ?? "Unknown error")")
                    }
                }
            }
            .padding()
            .background(Color.green)
            .foregroundColor(.white)
            .cornerRadius(8)
            
            // Відображення повідомлення про успішну реєстрацію
            if registrationSuccess {
                Text("Registration successful! You can now log in.")
                    .foregroundColor(.green)
                    .padding()
                
                Button("Back to Sign In") {
                    presentationMode.wrappedValue.dismiss()
                }
                .padding()
                .background(Color.blue)
                .foregroundColor(.white)
                .cornerRadius(8)
            }
        }
        .padding()
    }
}



#Preview {
    RegisterView()
}
