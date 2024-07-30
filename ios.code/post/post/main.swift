//
//  main.swift
//  post
//
//  Created by A. Mallik on 27/07/2024.
//

import Foundation

// Function to make an API call
func apiCall() {
    
    // Ensure the URL is valid
    guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts") else {
        print("Invalid URL")
        return
    }
    
    // Create the URL request and set HTTP method to POST
    var request = URLRequest(url: url)
    request.httpMethod = "POST"
    request.setValue("application/json", forHTTPHeaderField: "Content-Type")
    
    // Set up the request body with JSON data
    let body: [String: AnyHashable] = [
        "userId": 1,
        "title": "Hello from iOS Academy",
        "body": "The quick brown fox jumped over the lazy dog. The quick brown fox jumped over the lazy dog. The quick brown fox jumped over the lazy dog. The quick brown fox jumped over the lazy dog."
    ]
    
    do {
        // Convert body to JSON data
        let jsonData = try JSONSerialization.data(withJSONObject: body, options: .fragmentsAllowed)
        request.httpBody = jsonData
        print("JSON Data: \(String(data: jsonData, encoding: .utf8)!)")
    } catch {
        print("Error serializing JSON: \(error)")
        return
    }
    
    // Perform the network task
    let task = URLSession.shared.dataTask(with: request) { data, response, error in
        if let error = error {
            print("Error making request: \(error.localizedDescription)")
            return
        }
    }
    task.resume()
}

struct Response: Codable {
    
    let body: String
    let id: Int
    let title: String
    let userId: Int
}

// Call the function
apiCall()


