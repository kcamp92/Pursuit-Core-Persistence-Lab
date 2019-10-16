//
//  FavoritesTableViewCell.swift
//  Pursuit-Core-Persistence-Lab
//
//  Created by Krystal Campbell on 10/11/19.
//  Copyright © 2019 Krystal Campbell. All rights reserved.
//

import UIKit

class FavoritesTableViewCell: UITableViewCell {
    
    @IBOutlet weak var favoriteImage: UIImageView!
    @IBOutlet weak var favoritesLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

}
