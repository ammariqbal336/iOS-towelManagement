//
//  networkcall.swift
//  TowelManagement
//
//  Created by mac on 26/06/2024.
//

import Foundation
import Combine


class NetworkService {
    func get<T: Decodable>(urlString: String, responseType: T.Type) -> AnyPublisher<T, NetworkRemoteError> {
        guard let url = URL(string: urlString) else {
            return Fail(error: NetworkRemoteError.invalidURL).eraseToAnyPublisher()
        }
        
        var request = URLRequest(url: url)
               request.httpMethod = "GET"
       // let tokenData = UserDefaults.standard.string(forKey: "accessToken")
        let tokenData = getFromKeychain(forKey: "accessToken")
        if let token = tokenData{
            request.setValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
        }
        
        return URLSession.shared.dataTaskPublisher(for: request)
            .map { $0.data }
            .mapError { NetworkRemoteError.requestFailed($0) }
            .decode(type: T.self, decoder: JSONDecoder())
            .mapError { NetworkRemoteError.decodingFailed($0) }
            .eraseToAnyPublisher()
    }
    
    func post<T: Codable, U: Codable>(
            url: URL,
            body: T,
            responseType: U.Type
        ) -> AnyPublisher<U, Error> {
            // Encode the body to JSON
            let encoder = JSONEncoder()
            guard let bodyData = try? encoder.encode(body) else {
                return Fail(error: NetworkRemoteError.encodingError).eraseToAnyPublisher()
            }
            
            // Create the URLRequest
            var request = URLRequest(url: url)
            request.httpMethod = "POST"
            request.setValue("application/json", forHTTPHeaderField: "Content-Type")
            request.httpBody = bodyData
            
            // Perform the request
            return URLSession.shared.dataTaskPublisher(for: request)
                .map { $0.data } // Extract the data from the response
                .decode(type: U.self, decoder: JSONDecoder()) // Decode the data to the expected response type
                .eraseToAnyPublisher() // Type-erased publisher
        }
}
