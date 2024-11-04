import Foundation

var sessionCookie: String?

func login(login: String, password: String) {
    guard let url = URL(string: "https://notto-car.com/api/v1/login") else {
        print("Invalid URL")
        return
    }

    print("Making API call...")

    var request = URLRequest(url: url)
    request.httpMethod = "POST"
    request.setValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")

    let bodyString = "username=\(login)&password=\(password)"
    request.httpBody = bodyString.data(using: .utf8)

    let task = URLSession.shared.dataTask(with: request) { data, response, error in
        if let error = error {
            print("Error: \(error.localizedDescription)")
            return
        }

        if let httpResponse = response as? HTTPURLResponse {
            print("Status Code: \(httpResponse.statusCode)")

            // Отримуємо Cookie з відповіді
            if let fields = httpResponse.allHeaderFields as? [String: String],
               let url = httpResponse.url {
                let cookies = HTTPCookie.cookies(withResponseHeaderFields: fields, for: url)
                for cookie in cookies {
                    if cookie.name == "JSESSIONID" {
                        sessionCookie = "\(cookie.name)=\(cookie.value)"
                        print("Session Cookie stored: \(sessionCookie!)")
                        break
                    }
                }
                if sessionCookie == nil {
                    print("JSESSIONID not found in response cookies")
                }
            }
        }

        guard let data = data else {
            print("No data in response")
            return
        }

        do {
            let jsonResponse = try JSONSerialization.jsonObject(with: data, options: [])
            print("Response: \(jsonResponse)")
        } catch {
            print("Failed to parse response: \(error)")
        }
    }

    task.resume()
}

func getInfo() {
    guard let sessionCookie = sessionCookie else {
        print("No session cookie available. Please log in first.")
        return
    }

    guard let url = URL(string: "https://notto-car.com/api/v1/userInfo") else {
        print("Invalid URL")
        return
    }

    print("Making API call to get info...")

    var request = URLRequest(url: url)
    request.httpMethod = "GET"
    // Додаємо Cookie з JSESSIONID
    request.setValue(sessionCookie, forHTTPHeaderField: "Cookie")

    let task = URLSession.shared.dataTask(with: request) { data, response, error in
        if let error = error {
            print("Error: \(error.localizedDescription)")
            return
        }

        if let httpResponse = response as? HTTPURLResponse {
            print("Status Code: \(httpResponse.statusCode)")
        }

        guard let data = data else {
            print("No data in response")
            return
        }

        do {
            let jsonResponse = try JSONSerialization.jsonObject(with: data, options: [])
            print("Response: \(jsonResponse)")
        } catch {
            print("Failed to parse response: \(error)")
        }
    }

    task.resume()
}
