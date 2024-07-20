//
//  NowPlayingListViewController.swift
//  moviedb
//
//  Created by Ahmed samy on 20/07/2024.
//

import UIKit

class NowPlayingListViewController: UIViewController {
    
    @IBOutlet weak var movieListView: MovieItem!
    
    let viewModel: NowPlayingListViewModel = NowPlayingListViewModelProvider.get()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        movieListView.configView(title: "Now Playing")
        
        movieListView.delegate = self
        self.callDataSource()
    }
    
    func callDataSource(){
        self.viewModel.getListMovies(success: {
            self.movieListView.reload()
        },
                                     failed: { error in
        })
    }
    
}

extension NowPlayingListViewController : MovieListViewDelegate{
    func item(indexPath: IndexPath) -> Movie? {
        let item =   self.viewModel.getItemsForIndex(index: indexPath.row)
        return item;
    }
    
    func numberOfItems() -> Int {
        return self.viewModel.getNumberOfCell( )
    }
    
    func loadMore() {
        
    }
}
