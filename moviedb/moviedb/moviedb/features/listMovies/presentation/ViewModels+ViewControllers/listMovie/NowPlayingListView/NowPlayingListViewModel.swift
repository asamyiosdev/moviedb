//
//  NowPlayingListViewModel.swift
//  moviedb
//
//  Created by Ahmed samy on 20/07/2024.
//

import Foundation

protocol GetListMoviesViewModelContract {
    func getListMovies(
        success: @escaping (() -> Void),
        failed: @escaping (([String: Any]) -> Void));
}


class NowPlayingListViewModel : ListMovieViewModel {
    // MARK: - Public Methods
    //
    override init(
        getNowPlayingUsecase: GetNowPlayingUsecase) {
            super.init(getNowPlayingUsecase: getNowPlayingUsecase)
        }
}



extension NowPlayingListViewModel : GetListMoviesViewModelContract {
    
    func getListMovies(success: @escaping (() -> Void), failed: @escaping (([String : Any]) -> Void)) {
        self.getListMovieUsecase.get(success: { response in
            self.onrecieveResponse(response: response)
            success()
        },
                                     failed: { error in
            failed(error)
            
        })
    }
    
}



