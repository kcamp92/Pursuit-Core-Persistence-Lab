//
//  FavoriteDetailViewController.swift
//  Pursuit-Core-Persistence-Lab
//
//  Created by Krystal Campbell on 10/11/19.
//  Copyright © 2019 Krystal Campbell. All rights reserved.
//

import UIKit

class FavoriteDetailViewController: UIViewController {
    
    var favoriteDeets: FavoritedPhotos!
       
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpLabels()

           // Do any additional setup after loading the view.
       }
    @IBOutlet weak var imageViewOutlet: UIImageView!
    
    @IBOutlet weak var tagLabel: UILabel!
    @IBOutlet weak var favoriteLabel: UILabel!
    @IBOutlet weak var likeLabel: UILabel!
   
    func setUpLabels() {
        tagLabel.text = favoriteDeets.tags
        favoriteLabel.text = favoriteDeets.favorites?.description
        likeLabel.text = favoriteDeets.likes?.description
        
        if let image = favoriteDeets.largeImageURL {
            ImageHelper.shared.getImage(urlStr: image) {
                (results) in
            DispatchQueue.main.async {
            switch results {
                case .failure(let error):
                    print(error)
                case .success(let image):
                    self.imageViewOutlet.image = image
                           }
                       }
                   }
               }
    }
   
    

    // MARK: - Navigation


}
