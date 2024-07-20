//
//  MovieItemCell.swift
//  moviedb
//
//  Created by Ahmed samy on 20/07/2024.
//

import UIKit

class MovieItemCell: UICollectionViewCell {

    @IBOutlet weak var imageMovie: UIImageView!
    
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var dateLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }


    
    // MARK: - Public Methods
    
    func configureCell(movie: Movie) {
        let imagePath = movie.posterPath
        nameLabel.text = movie.originalTitle
        dateLabel.text = movie.releaseDate
        let imageURLString = "https://image.tmdb.org/t/p/w500\(imagePath)"
        
        if let url = URL(string: imageURLString) {
                 ImageLoader.shared.loadImage(from: url) { image in
                     self.imageMovie.image = image
                     self.imageMovie.contentMode = .scaleAspectFill
                     self.imageMovie.clipsToBounds = true
                 }
             }
      
    }
}
