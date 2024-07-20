//
//  NowPlayingListViewModel.swift
//  moviedb
//
//  Created by Ahmed samy on 20/07/2024.
//

import Foundation

protocol GetListMoviesViewModelContract {
    func getListMovies(
        fromLoadMore:Bool,
        success: @escaping (() -> Void),
        failed: @escaping (([String: Any]) -> Void));
}


class NowPlayingListViewModel : ListMovieViewModel {
    // MARK: - Public Methods
    //
    init(
        getNowPlayingUsecase: GetNowPlayingUsecase) {
            super.init(getListMovieUsecase: getNowPlayingUsecase)
        }
}



extension NowPlayingListViewModel : GetListMoviesViewModelContract {
    
    func getListMovies(fromLoadMore:Bool,
                       success: @escaping (() -> Void), failed: @escaping (([String : Any]) -> Void)) {
        self.getListMovieUsecase.get(success: { response in
            self.onrecieveResponse(response: response)
            success()
        },
                                     failed: { error in
            failed(error)
            
        })
    }
    
}



