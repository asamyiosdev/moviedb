//
//  listMovieViewModle.swift
//  moviedb
//
//  Created by Ahmed samy on 19/07/2024.
//

import Foundation

class ListMovieViewModel {
    // MARK: - Properties
  
    var dataChanged: (() -> Void)?
    
    var listMovies = [Movie]()
    var ListMovieApiResponse:ListMovieApiResponse? = nil
    var getListMovieUsecase: GetListMoviesUsecaseContract
    
    // MARK: - Public Methods
    //
    init(
        getNowPlayingUsecase: GetNowPlayingUsecase) {
            self.getListMovieUsecase = getNowPlayingUsecase
        }
    
    func onrecieveResponse(response:ListMovieApiResponse){
        self.ListMovieApiResponse = response
        self.listMovies = response.results
    }
    
    func getItemsForIndex(index:Int)-> Movie?{
        let movie = listMovies[index]
        return movie
    }
    
    func getNumberOfCell()-> Int{
        return listMovies.count
    }
}





