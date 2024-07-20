//
//  UpcomingListMovieViewModel.swift
//  moviedb
//
//  Created by Ahmed samy on 20/07/2024.
//

import Foundation

class UpcomingListMovieViewModel : ListMovieViewModel {
    // MARK: - Public Methods
    //
    init(
        getUpcomingUsecase: GetUpcomingUsecase) {
            super.init(getListMovieUsecase: getUpcomingUsecase)
        }
}



extension UpcomingListMovieViewModel : GetListMoviesViewModelContract {
    
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



