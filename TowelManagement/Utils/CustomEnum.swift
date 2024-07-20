//
//  CustomEnum.swift
//  TowelManagement
//
//  Created by mac on 26/06/2024.
//

import Foundation
enum NetworkError: Error{
 case DataSourceError, CreateError, DeleteError, UpdateError, FetchError
}

enum NetworkRemoteError: Error {
    case invalidURL
    case requestFailed(Error)
    case invalidResponse
    case decodingFailed(Error)
    case encodingError
}
