//
//  PhotosAPIClient.swift
//  Pursuit-Core-Persistence-Lab
//
//  Created by Krystal Campbell on 10/11/19.
//  Copyright © 2019 Krystal Campbell. All rights reserved.
//

import Foundation
class PicturesAPIClient{
    
    private init() {}
    static let shared = PicturesAPIClient()
    
    func getImages(searchTerm: String, completionHandler: @escaping (Result<[Hit], Error>)-> Void){
        
        let urlString = "https://pixabay.com/api/?key=13914646-74defb60eef565463557ca2e6&q=\(searchTerm.replacingOccurrences(of: "", with: "+"))"
        
        guard let url  = URL(string: urlString) else {
            completionHandler(.failure(AppError.badURL))
            return
        }
        
        NetworkHelper.manager.performDataTask(withUrl: url, andMethod: .get) { (results) in
            switch results {
            case .failure(let error):
                completionHandler(.failure(error))
            case .success(let data):
                do {
                    let imagesDecoded = try JSONDecoder().decode(Pictures.self, from: data)
                    completionHandler(.success(imagesDecoded.hits))
                } catch {
                    completionHandler(.failure(AppError.couldNotParseJSON(rawError:error)))
                }
            }
        }
    }
}

