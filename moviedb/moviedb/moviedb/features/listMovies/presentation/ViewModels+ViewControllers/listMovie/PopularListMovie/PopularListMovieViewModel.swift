//
//  PopularListMovieViewModel.swift
//  moviedb
//
//  Created by Ahmed samy on 20/07/2024.
//

import Foundation


class PopularListMovieViewModel : ListMovieViewModel {
    // MARK: - Public Methods
    //
    init(
        getPopularUsecase: GetPopularUsecase) {
            super.init(getListMovieUsecase: getPopularUsecase)
        }
}



extension PopularListMovieViewModel : GetListMoviesViewModelContract {
    
    func getListMovies(fromLoadMore:Bool,
                       success: @escaping (() -> Void), failed: @escaping (([String : Any]) -> Void)) {
        let page = self.getNextNumberPage()
        self.getListMovieUsecase.get(page:page,
                                     success: { response in
            
            self.onrecieveResponse(response: response)
            success()
        },
                                     failed: { error in
            failed(error)
            
        })
    }
    
}



