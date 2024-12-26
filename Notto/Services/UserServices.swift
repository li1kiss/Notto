//
//  UserService.swift
//  Notto
//
//  Created by Mykhailo Kravchuk on 29/11/2024.
//

import Foundation

class UserService: ObservableObject {

    // MARK: - Запит інформації про користувача
    func getInfo(sessionCookie: String?) {
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

    // MARK: - Допоміжні функції
    func createRequest(url: URL, method: String) -> URLRequest {
        var request = URLRequest(url: url)
        request.httpMethod = method
        return request
    }
}
