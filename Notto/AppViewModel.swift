//
//  AppViewModel.swift
//  Notto
//
//  Created by Mykhailo Kravchuk on 02/11/2024.
//

import Foundation
import Combine

class AppViewModel: ObservableObject {
    // Відстеження статусу входу користувача
    @Published var isLoggedIn: Bool = false
    
    // Збереження JSESSIONID для ідентифікації сесії
    private var sessionCookie: String?
    
//     MARK: - Логін Користувача
    func login(username: String, password: String) {
        guard let url = URL(string: "https://notto-car.com/api/v1/login") else {
            print("Invalid URL")
            return
        }

        var request = createRequest(url: url, method: "POST")
        request.setValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
        request.httpBody = "username=\(username)&password=\(password)".data(using: .utf8)

        URLSession.shared.dataTask(with: request) { [weak self] data, response, error in
            if let error = error {
                self?.handleLoginError(error)
                return
            }
            
            self?.processLoginResponse(data: data, response: response)
        }.resume()
    }
    
    private func handleLoginError(_ error: Error) {
        print("Login error: \(error.localizedDescription)")
        DispatchQueue.main.async {
            self.isLoggedIn = false
        }
    }

    private func processLoginResponse(data: Data?, response: URLResponse?) {
        guard let httpResponse = response as? HTTPURLResponse else { return }
        
        if httpResponse.statusCode == 200 {
            if let cookie = extractSessionCookie(from: httpResponse) {
                DispatchQueue.main.async {
                    self.sessionCookie = cookie
                    self.isLoggedIn = true
                    self.getInfo()
                }
            } else {
                print("JSESSIONID not found in response cookies")
                DispatchQueue.main.async { self.isLoggedIn = false }
            }
        } else {
            print("Login failed with status code: \(httpResponse.statusCode)")
            DispatchQueue.main.async { self.isLoggedIn = false }
        }
    }
    
    
    // MARK: - Реєстрація Користувача
        func register(email: String, password: String, completion: @escaping (Bool, String?) -> Void) {
            guard let url = URL(string: "https://notto-car.com/api/v1/register") else {
                print("Invalid URL")
                completion(false, "Invalid URL")
                return
            }

            var request = URLRequest(url: url)
            request.httpMethod = "POST"
            request.setValue("application/json", forHTTPHeaderField: "Content-Type")

            let parameters = ["email": email, "password": password]
            
            do {
                request.httpBody = try JSONSerialization.data(withJSONObject: parameters, options: [])
            } catch {
                print("Failed to serialize JSON: \(error)")
                completion(false, "Failed to serialize JSON")
                return
            }

            URLSession.shared.dataTask(with: request) { data, response, error in
                if let error = error {
                    print("Register error: \(error.localizedDescription)")
                    completion(false, error.localizedDescription)
                    return
                }

                guard let httpResponse = response as? HTTPURLResponse else {
                    completion(false, "No response from server")
                    return
                }

                if httpResponse.statusCode == 201 {
                    print("Registration successful")
                    completion(true, nil)
                } else {
                    let errorMessage = "Registration failed with status code: \(httpResponse.statusCode)"
                    print(errorMessage)
                    completion(false, errorMessage)
                }
            }.resume()
        }
    
    // MARK: - Запит Інформації про Користувача
    func getInfo() {
        guard let sessionCookie = sessionCookie else {
            print("No session cookie available. Please log in first.")
            return
        }

        guard let url = URL(string: "https://notto-car.com/api/v1/userInfo") else {
            print("Invalid URL")
            return
        }

        var request = createRequest(url: url, method: "GET")
        request.setValue(sessionCookie, forHTTPHeaderField: "Cookie")

        URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                print("Error: \(error.localizedDescription)")
                return
            }
            
            self.processGetInfoResponse(data: data, response: response)
        }.resume()
    }
    
    private func processGetInfoResponse(data: Data?, response: URLResponse?) {
        guard let data = data else {
            print("No data in response")
            return
        }

        do {
            let jsonResponse = try JSONSerialization.jsonObject(with: data, options: [])
            print("User Info Response: \(jsonResponse)")
        } catch {
            print("Failed to parse response: \(error)")
        }
    }
    
    // MARK: - Вихід з Системи
    func logout() {
        guard let sessionCookie = sessionCookie else {
            print("No session cookie available.")
            return
        }

        guard let url = URL(string: "https://notto-car.com/api/v1/logout") else {
            print("Invalid URL")
            return
        }

        var request = createRequest(url: url, method: "POST")
        request.setValue(sessionCookie, forHTTPHeaderField: "Cookie")

        URLSession.shared.dataTask(with: request) { [weak self] data, response, error in
            if let error = error {
                print("Logout error: \(error.localizedDescription)")
                return
            }
            
            self?.handleLogout()
        }.resume()
    }
    
    private func handleLogout() {
        DispatchQueue.main.async {
            self.isLoggedIn = false
            self.sessionCookie = nil
            print("Logged out and session cookie cleared.")
        }
    }
    
    // MARK: - Допоміжні Функції
    private func createRequest(url: URL, method: String) -> URLRequest {
        var request = URLRequest(url: url)
        request.httpMethod = method
        return request
    }

    private func extractSessionCookie(from response: HTTPURLResponse) -> String? {
        if let fields = response.allHeaderFields as? [String: String],
           let url = response.url {
            let cookies = HTTPCookie.cookies(withResponseHeaderFields: fields, for: url)
            for cookie in cookies where cookie.name == "JSESSIONID" {
                print("Session Cookie stored: \(cookie.name)=\(cookie.value)")
                return "\(cookie.name)=\(cookie.value)"
            }
        }
        return nil
    }
}