//
//  PhotoSearchViewController.swift
//  Pursuit-Core-Persistence-Lab
//
//  Created by Krystal Campbell on 10/11/19.
//  Copyright © 2019 Krystal Campbell. All rights reserved.
//

import UIKit

class PictureSearchViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UISearchBarDelegate {
    
    var pictures = [Hit]() {
        didSet{
            CollectionViewOutlet.reloadData()
        }
    }
    
    var searchString: String? = nil {
          didSet {
              CollectionViewOutlet.reloadData()
          }
      }
    
    var searchedResults: [Hit] {
        guard let searchString = searchString else {
            return pictures
        }
        guard searchString != "" else {
            return pictures
        }
        return pictures
    }
 // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        loadCollectionView()

       }
      
 // MARK: - IBOutlets
    
    @IBOutlet weak var SearchBarOutlet: UISearchBar!
    
    @IBOutlet weak var CollectionViewOutlet: UICollectionView!
    
// MARK: - CollectionView Functions
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return searchedResults.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let image = pictures[indexPath.item]
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ImageCell", for: indexPath) as! PictureCollectionViewCell
        if let imageUnwrapped = image.largeImageURL {
            ImageHelper.shared.getImage(urlStr: imageUnwrapped){ (result) in
                DispatchQueue.main.async {
                    switch result {
                    case .failure(let error):
                        print(error)
                    case .success(let imageFromOnline):
                        cell.imageOutlet.image = imageFromOnline
                    }
                }
            }
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let storyBoard = storyboard?.instantiateViewController(withIdentifier: "PictureSearchDetailViewController") as! PictureSearchDetailViewController
        
     
      
    }
// MARK: - SearchBar Functions
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchString = searchBar.text
        loadData(searchTerm: searchBar.text!)
    }
  
    func loadCollectionView(){
        CollectionViewOutlet.dataSource = self
        CollectionViewOutlet.delegate = self
        SearchBarOutlet.delegate = self
        
    }
    
// MARK: - Private Functions
    
    private func loadData(searchTerm: String) {
        PicturesAPIClient.shared.getImages(searchTerm: searchTerm){
            (result) in
            DispatchQueue.main.async {
                switch result {
                case.success(let imagesFromOnline):
                    self.pictures = imagesFromOnline
                case.failure(let error):
                    print(error)
            
                }
            }
        }
    }
}

extension PictureSearchViewController: UICollectionViewDelegateFlowLayout {
func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    return CGSize.init(width: 350, height: 350)
    }
}
/* func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let detailStoryBoard = storyboard?.instantiateViewController(withIdentifier: "DetailViewControllerOne") as! DetailViewControllerOne
        
detailStoryBoard.passingInfo = pictures[indexPath.item]
        
        
        navigationController?.pushViewController(detailStoryBoard, animated: true)
    }
}
*/
