//
//  NowPlayingListViewModelProvider.swift
//  moviedb
//
//  Created by Ahmed samy on 20/07/2024.
//

import Foundation

class NowPlayingListViewModelProvider {
    static func get() -> NowPlayingListViewModel {
        return NowPlayingListViewModel(getNowPlayingUsecase: GetNowPlayingUsecaseProvider.get())
    }
}
