//
//  FavoritesModel.swift
//  Pursuit-Core-Persistence-Lab
//
//  Created by Krystal Campbell on 10/11/19.
//  Copyright © 2019 Krystal Campbell. All rights reserved.
//

import Foundation

struct FavoritedPhotos: Codable {
    let likes: Int?
    let favorites: Int?
    let tags: String?
    let previewUrl: String?

}
