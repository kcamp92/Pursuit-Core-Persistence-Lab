//
//  AppError.swift
//  Pursuit-Core-Persistence-Lab
//
//  Created by Krystal Campbell on 10/11/19.
//  Copyright © 2019 Krystal Campbell. All rights reserved.
//

import Foundation

enum AppError: Error {
    case unauthenticated
    case invalidJSONResponse
    case couldNotParseJSON(rawError: Error)
    case noInternetConnection
    case badURL
    case badStatusCode
    case noDataReceived
    case notAnImage
    case other(rawError: Error)
}
