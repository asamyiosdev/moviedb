//
//  MovieDetailsViewController.swift
//  moviedb
//
//  Created by Ahmed samy on 20/07/2024.
//

import UIKit

class MovieDetailsViewController: BasicViewController {
    
    @IBOutlet weak var overviewLabel: UILabel!
    @IBOutlet weak var productionCompaniesCollectionView: UICollectionView!
    let viewModel: MovieDetailsViewModel = MovieDetailsViewModelProvider.get()
    private var movieId:Int?
    
    @IBOutlet weak var customNavigationBar: CustomNavigationBar!
    @IBOutlet weak var imagePoster: UIImageView!
    
    
    @IBOutlet weak var popularityLabel: UILabel!
    
    @IBOutlet weak var releaseDateLabel: UILabel!
    
    @IBOutlet weak var voteAverage: UILabel!
    
    @IBOutlet weak var taglineLabel: UILabel!
    func configureViewController(id:Int){
        self.movieId = id
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        customNavigationBar.config(backAction: ({
            self.dismiss(animated: true)
        }))
        
        callDataSource()
        
        self.configProductionCompaniesCollectionView()
        
    }

    func callDataSource(){
        guard let movieId = self.movieId else { return }
        self.showLoading()
        self.viewModel.getMovieDetails(id: movieId,
                                       success: {
            self.hideLoading()
            DispatchQueue.main.async {
                self.reloadViews()
            }
        },
                                       failed: { error in
            self.hideLoading()
            let message = error.getString("message")
            self.showAlert(title: "Faild", message: message)
        })
    }
    
    func reloadViews(){
        let movieDetails =  self.viewModel.movieDetails
        
        self.customNavigationBar.configTitleView(title: movieDetails?.title)
        let imagePath = movieDetails?.backdropPath ?? ""
        self.overviewLabel.text = movieDetails?.overview
        
        self.popularityLabel.text = "\(movieDetails?.popularity ?? 0)"
        self.releaseDateLabel.text = movieDetails?.releaseDate
        self.voteAverage.text = "\(movieDetails?.voteAverage ?? 0)"
        self.taglineLabel.text = movieDetails?.tagline
        
        let imageURLString = "https://image.tmdb.org/t/p/w500\(imagePath)"
        if let url = URL(string: imageURLString) {
            ImageLoader.shared.loadImage(from: url) { image in
                self.imagePoster.image = image
            }
        }
        
        self.productionCompaniesCollectionView.reloadData()
    }
}


extension MovieDetailsViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    private func configProductionCompaniesCollectionView() {
        
        self.productionCompaniesCollectionView?.backgroundColor = UIColor.clear
        self.productionCompaniesCollectionView?.backgroundView = UIView(frame: CGRect.zero)
                productionCompaniesCollectionView.contentInset = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)
        
        self.productionCompaniesCollectionView.reloadData()
    }
    
    // MARK: - ----------------------{ CollectionView delegete }-----------------------
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.viewModel.movieDetails?.productionCompanies.count ?? 0
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ProductionCompaniesCell", for: indexPath) as? ProductionCompaniesCell else {
            return UICollectionViewCell()
        }
        
        let item = self.viewModel.movieDetails?.productionCompanies[indexPath.row]
        
        cell.configureCell(item: item!)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }
    
}
