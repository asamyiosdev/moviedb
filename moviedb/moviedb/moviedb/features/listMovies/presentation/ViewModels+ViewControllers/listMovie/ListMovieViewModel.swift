//
//  listMovieViewModle.swift
//  moviedb
//
//  Created by Ahmed samy on 19/07/2024.
//

import Foundation

protocol GetListMoviesViewModelContract {
    func getListMovies(
        fromLoadMore:Bool,
        success: @escaping (() -> Void),
        failed: @escaping (([String: Any]) -> Void));
}

class ListMovieViewModel {
    // MARK: - Properties
    
    var listMovies = [Movie]()
    var ListMovieApiResponse:ListMovieApiResponse? = nil
    var getListMovieUsecase: GetListMoviesUsecaseContract
    
    // MARK: - Public Methods
    //
    init(
        getListMovieUsecase: GetListMoviesUsecaseContract) {
            self.getListMovieUsecase = getListMovieUsecase
        }
    
    func onrecieveResponse(response:ListMovieApiResponse){
        self.ListMovieApiResponse = response
       let results = response.results
        self.listMovies.append(contentsOf: results)
    }
    
    func getItemsForIndex(index:Int)-> Movie?{
        let movie = listMovies[index]
        return movie
    }
    
    func getNumberOfCell()-> Int{
        return listMovies.count
    }
    
    func showMoreButton()-> Bool{
        let page = ListMovieApiResponse?.page ?? 0
        let totalPages = ListMovieApiResponse?.totalPages ?? 0
        return page < totalPages
    }
    
    func getNextNumberPage()-> Int{
        let page = ListMovieApiResponse?.page ?? 0
        return page + 1
    }
}
