//
//  ProductionCompaniesCell.swift
//  moviedb
//
//  Created by Ahmed samy on 21/07/2024.
//

import UIKit

class ProductionCompaniesCell: UICollectionViewCell {
    
    @IBOutlet weak var imageProduction: UIImageView!
    
    @IBOutlet weak var nameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }


    
    // MARK: - Public Methods
    
    func configureCell(item: ProductionCompany) {
        let imagePath = item.logoPath
        nameLabel.text = item.name

        let imageURLString = "https://image.tmdb.org/t/p/w500\(imagePath)"

        if let url = URL(string: imageURLString) {
                 ImageLoader.shared.loadImage(from: url) { image in
                     self.imageProduction.image = image
                     self.imageProduction.contentMode = .scaleAspectFill
                     self.imageProduction.clipsToBounds = true
                 }
             }
      
    }
}

