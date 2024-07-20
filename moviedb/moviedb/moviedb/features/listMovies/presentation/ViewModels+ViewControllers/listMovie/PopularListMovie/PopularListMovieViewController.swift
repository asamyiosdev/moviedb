//
//  PopularListMovieViewController.swift
//  moviedb
//
//  Created by Ahmed samy on 20/07/2024.
//

import UIKit

class PopularListMovieViewController: BasicViewController {
    @IBOutlet weak var movieListView: MovieItem!
    
    let viewModel: PopularListMovieViewModel = PopularListMovieViewModelProvider.get()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        movieListView.configView(title: "Now Playing")
        movieListView.delegate = self
        self.callDataSource()
    }
    
    func callDataSource(fromLoadMore:Bool = false){
        self.showLoading()
        self.viewModel.getListMovies(
            fromLoadMore:fromLoadMore,
            success: {
                self.movieListView.reload()
                self.hideLoading()
            },
            failed: { error in
                self.hideLoading()
                let message = error.getString("message")
                self.showAlert(title: "Faild", message: message)
            })
    }
    
}

extension PopularListMovieViewController : MovieListViewDelegate{
    func item(indexPath: IndexPath) -> Movie? {
        let item =   self.viewModel.getItemsForIndex(index: indexPath.row)
        return item;
    }
    
    func numberOfItems() -> Int {
        return self.viewModel.getNumberOfCell( )
    }
    
    func showMoreButton() -> Bool {
        return self.viewModel.showMoreButton()
    }
    
    func loadMore() {
        self.callDataSource(fromLoadMore: true)
    }
}
