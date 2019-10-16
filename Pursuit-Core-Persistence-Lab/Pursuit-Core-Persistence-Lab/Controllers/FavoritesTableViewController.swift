//
//  FavoritesTableViewController.swift
//  Pursuit-Core-Persistence-Lab
//
//  Created by Krystal Campbell on 10/11/19.
//  Copyright © 2019 Krystal Campbell. All rights reserved.
//

import UIKit

class FavoritesTableViewController: UIViewController,UITableViewDataSource, UITableViewDelegate {
    
    var favoritedPictures = [FavoritedPhotos]() {
        didSet{
            favoritesTableView.reloadData()
        }
    }
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        loadData()
    }
    
    
    @IBOutlet weak var favoritesTableView: UITableView!
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return favoritedPictures.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let favorites = favoritedPictures[indexPath.row]
        let cell = favoritesTableView.dequeueReusableCell(withIdentifier: "favoriteCell") as! FavoritesTableViewCell
        //  cell.favoritesLabel = "Likes: \(favorites.favorites)"
        if let image = favorites.previewUrl {
            ImageHelper.shared.getImage(urlStr: image) {
                (result) in
                DispatchQueue.main.async {
                    switch (result) {
                    case .success(let picture):
                        cell.favoriteImage.image = picture
                    case . failure(let error):
                        print(error)
                    }
                }
            }
        }
        return cell
    }
    
    func loadData(){
        do {favoritedPictures = try ImagePersistenceManager.manager.getImage()
            favoritesTableView.reloadData()
        } catch let error {
            print(error)
        }
    }
    func setupView() {
        favoritesTableView.dataSource = self
        favoritesTableView.delegate = self
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        var favoritedDetails = storyboard?.instantiateViewController(withIdentifier: "FavoriteDetailViewController") as! FavoriteDetailViewController
        
        favoritedDetails.favoriteDeets = favoritedPictures[indexPath.row]
        navigationController?.pushViewController(favoritedDetails, animated: true)
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 280
    }
}

