//
//  PhotoModel.swift
//  Pursuit-Core-Persistence-Lab
//
//  Created by Krystal Campbell on 10/11/19.
//  Copyright © 2019 Krystal Campbell. All rights reserved.
//

import Foundation

struct Pictures: Codable {
    let hits: [Hit]
}

struct Hit: Codable {
    let largeImageURL: String?
    let pageURL: String?
    let webformatURL: String?
    let userImageURL: String?
    let previewURL: String?
}
