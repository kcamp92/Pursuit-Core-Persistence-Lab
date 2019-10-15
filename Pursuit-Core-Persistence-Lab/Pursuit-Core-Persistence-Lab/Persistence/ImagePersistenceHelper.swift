//
//  ImagePersistenceHelper.swift
//  Pursuit-Core-Persistence-Lab
//
//  Created by Krystal Campbell on 10/11/19.
//  Copyright © 2019 Krystal Campbell. All rights reserved.
//

import Foundation

struct ImagePersistenceManager {
    private init (){}
static let manager = ImagePersistenceManager()
private let persistenceHelper = PersistenceHelper<FavoritedPhotos>(fileName: "image.plist")
    
    func saveImage(image: FavoritedPhotos) throws {
        try persistenceHelper.save(newElement: image)
    }
    
    func getImage() throws -> [FavoritedPhotos] {
        return try persistenceHelper.getObjects()
    }
}
 
