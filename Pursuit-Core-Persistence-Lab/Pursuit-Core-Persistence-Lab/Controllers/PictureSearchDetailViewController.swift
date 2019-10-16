//
//  PictureSearchDetailViewController.swift
//  Pursuit-Core-Persistence-Lab
//
//  Created by Krystal Campbell on 10/15/19.
//  Copyright © 2019 Krystal Campbell. All rights reserved.
//

import UIKit

class PictureSearchDetailViewController: UIViewController {
    
   var imageDeets: Hit!
    
//MARK: - IBOutlets
    
    @IBOutlet weak var previewUrlLabel: UILabel!
    @IBOutlet weak var tagsLabel: UILabel!
    @IBOutlet weak var favoritesLabel: UILabel!
    @IBOutlet weak var likesLabel: UILabel!
    @IBOutlet weak var imageVIewOutlet: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupLabels()
    }
    

  //  MARK: - IB Actions

    @IBAction func FavoritesButton(_ sender: UIButton) {
        let savedImage = FavoritedPhotos(likes: imageDeets?.likes, favorites: imageDeets?.favorites, tags: imageDeets?.tags, previewUrl: imageDeets?.previewURL)
        DispatchQueue.global(qos: .utility).async {
            try?
                ImagePersistenceManager.manager.saveImage(image: savedImage)
            DispatchQueue.main.async {
                self.navigationController?.popViewController(animated: true)
            }
        }
    }
    
    //  MARK: - Methods
    
    func setupLabels() {
        tagsLabel.text = imageDeets.tags
        previewUrlLabel.text = imageDeets.previewURL
        favoritesLabel.text = imageDeets.favorites?.description
        likesLabel.text = imageDeets.likes?.description
        
        if let image = imageDeets.largeImageURL {
        ImageHelper.shared.getImage(urlStr: image) {
            (results) in
            DispatchQueue.main.async {
                switch results {
                case .failure(let error):
                    print(error)
                case .success(let picture):
                    self.imageVIewOutlet.image = picture
                    }
                }
            }
        }
    }
}
