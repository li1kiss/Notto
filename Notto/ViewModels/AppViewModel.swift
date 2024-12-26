//
//  AppViewModel.swift
//  Notto
//
//  Created by Mykhailo Kravchuk on 02/11/2024.
//

import Foundation
import Combine
import SwiftUI

class AppViewModel: ObservableObject {

    // Збереження JSESSIONID для ідентифікації сесії
    private var sessionCookie: String?
    
////     MARK: - Login User
//    func login(username: String, password: String) {
//        guard let url = URL(string: "https://notto-car.com/api/v1/login") else {
//            print("Invalid URL")
//            return
//        }
//print("username=\(username)&password=\(password)")
//        var request = createRequest(url: url, method: "POST")
//        request.setValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
////        request.httpBody = "username=\(username)&password=\(password)".data(using: .utf8)
//        request.httpBody = "username=test@email.com&password=testtest".data(using: .utf8)
//        
//        
//        URLSession.shared.dataTask(with: request) { [weak self] data, response, error in
//            if let error = error {
//                self?.handleLoginError(error)
//                return
//            }
//            
//            self?.processLoginResponse(data: data, response: response)
//        }.resume()
//    }
//    
//    private func handleLoginError(_ error: Error) {
//        print("Login error: \(error.localizedDescription)")
//        DispatchQueue.main.async {
//            self.isLoggedIn = false
//        }
//    }

   
    
    
    
    
    // MARK: - Вихід з Системи
    
    
     
    
   


    
}
