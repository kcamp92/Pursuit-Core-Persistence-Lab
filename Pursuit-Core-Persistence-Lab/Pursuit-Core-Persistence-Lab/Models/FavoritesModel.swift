//
//  FavoritesModel.swift
//  Pursuit-Core-Persistence-Lab
//
//  Created by Krystal Campbell on 10/11/19.
//  Copyright © 2019 Krystal Campbell. All rights reserved.
//

import Foundation

struct FavoritedPhotos: Codable {
    var likes: Int?
    var favorites: Int?
    var tags: String?
    var previewUrl: String?
    var largeImageURL: String?
}
