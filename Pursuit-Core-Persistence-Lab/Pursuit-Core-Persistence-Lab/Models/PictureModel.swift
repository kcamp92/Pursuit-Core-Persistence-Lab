//
//  PhotoModel.swift
//  Pursuit-Core-Persistence-Lab
//
//  Created by Krystal Campbell on 10/11/19.
//  Copyright © 2019 Krystal Campbell. All rights reserved.
//

import Foundation

struct Picture: Codable {
    let hits: [Hit]
}

struct Hit: Codable {
    let largeImageURL: String?
    let pageURL: String?
    let webformatURL: String?
    let userImageURL: String?
    let previewURL: String?
    
    
    
    
    
    
    /*"largeImageURL": "https://pixabay.com/get/50e4d246485ab108f5d0846096293477143bd8e1554c704c722f73d79749cd5f_1280.jpg",
        "webformatHeight": 359,
        "webformatWidth": 640,
        "likes": 1304,
        "imageWidth": 4919,
        "id": 647528,
        "user_id": 526143,
        "views": 453449,
        "comments": 144,
        "pageURL": "https://pixabay.com/illustrations/dog-wolf-yelp-moon-tree-night-647528/",
        "imageHeight": 2763,
        "webformatURL": "https://pixabay.com/get/50e4d246485ab108f5d0846096293477143bd8e1554c704c722f73d79749cd5f_640.jpg",
        "type": "illustration",
        "previewHeight": 84,
        "tags": "dog, wolf, yelp",
        "downloads": 94243,
        "user": "Pezibear",
        "favorites": 1070,
        "imageSize": 3467200,
        "previewWidth": 150,
        "userImageURL": "https://cdn.pixabay.com/user/2019/03/28/14-46-04-252_250x250.jpg",
        "previewURL": "https://cdn.pixabay.com/photo/2015/02/24/15/41/dog-647528_150.jpg"
    },*/
    
}
