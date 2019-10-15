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
    
    static let shared = ImageHelper()
    
    func getImage(elementNum:String, completionHandler: @escaping(Result<UIImage, AppError>) -> ()){
        let imageURL = "http://www.theodoregray.com/periodictable/Tiles/\(elementNum)/s7.JPG"
        
        guard let url = URL(string: imageURL) else {
            completionHandler(.failure(AppError.badURL))
            return
        }
        NetworkHelper.manager.performDataTask(withUrl: url, andMethod: .get) {(result) in
            switch result{
            case .failure(let error):
                completionHandler(.failure(.couldNotParseJSON(rawError: error)))
            case .success(let data):
                guard let image = UIImage(data: data) else {
                    completionHandler(.failure(.notAnImage))
                    return
                }
                completionHandler(.success(image))
            }
        }
    }
}
//"https://pixabay.com/api/?key=13914646-74defb60eef565463557ca2e6&q="\()"
