//
//  ImageHelper.swift
//  Pursuit-Core-Persistence-Lab
//
//  Created by Krystal Campbell on 10/11/19.
//  Copyright © 2019 Krystal Campbell. All rights reserved.
//

import Foundation
import UIKit

class ImageHelper {
    private init() {}
    
    // MARK: - Static Properties
    static let shared = ImageHelper()
    
    // MARK: - Internal Methods
    func getImage(urlStr: String, completionHandler: @escaping (Result<UIImage,AppError>) -> ()) {
        
        guard let url = URL(string: urlStr) else {
            completionHandler(.failure(.badURL))
            return
        }
        
        URLSession.shared.dataTask(with: url) { (data, _, error) in
            guard error == nil else {
                completionHandler(.failure(.noDataReceived))
                return
            }
            
            guard let data = data else {
                completionHandler(.failure(.noDataReceived))
                return
            }
            
            guard let image = UIImage(data: data) else {
                completionHandler(.failure(.notAnImage))
                return
            }
            
            completionHandler(.success(image))
            
            } .resume()
        
    }
    
}


//class ImageHelper {
//    private init() {}
//
//    static let shared = ImageHelper()
//
//    func getImage(imageSearched:String, completionHandler: @escaping(Result<UIImage, AppError>) -> ()){
//        let imageURL = "https://pixabay.com/api/?key=13914646-74defb60eef565463557ca2e6&q=\(imageSearched.lowercased())"
//
//        guard let url = URL(string: imageURL) else {
//            completionHandler(.failure(AppError.badURL))
//            return
//        }
//        NetworkHelper.manager.performDataTask(withUrl: url, andMethod: .get) {(result) in
//            switch result{
//            case .failure(let error):
//                completionHandler(.failure(.couldNotParseJSON(rawError: error)))
//            case .success(let data):
//                guard let image = UIImage(data: data) else {
//                    completionHandler(.failure(.notAnImage))
//                    return
//                }
//                completionHandler(.success(image))
//            }
//        }
//    }
//}
