//
//  MovieDetails.swift
//  moviedb
//
//  Created by Ahmed samy on 20/07/2024.
//

import Foundation


class MovieDetailsDataMapper {
    static func fromApiMap(response: [String: Any]) -> MovieDetailsDataModel {
        return MovieDetailsDataModel(adult: response.getBool("adult"),
                                     backdropPath: response.getString("backdrop_path"),
                                     belongsToCollection: BelongsToCollectionDataMapper.fromApiMap(response: response.getDictionary("belongs_to_collection")),
                                     budget: response.getInt("budget"),
                                     genres: GenreDataMapperDataMapper.fromListApiMap(list: response.getArray("genres", defaultValue: [])),
                                     homepage: response.getString("homepage"),
                                     id: response.getInt("id"),
                                     imdbID: response.getString("imdbID"),
                                     originCountry: response.getArray("origin_country")  as? [String] ?? [],
                                     originalLanguage: response.getString("original_language"),
                                     originalTitle: response.getString("original_title"),
                                     overview: response.getString("overview"),
                                     popularity: response.getDouble("popularity"),
                                     posterPath: response.getString("poster_path"),
                                     productionCompanies: ProductionCompanyDataMapper.fromListApiMap(list: response.getArray("production_companies")),
                                     productionCountries: ProductionCountryDataMapper.fromListApiMap(list: response.getArray("production_countries")),
                                     releaseDate: response.getString("release_date"),
                                     revenue: response.getInt("revenue"),
                                     runtime: response.getInt("runtime"),
                                     status: response.getString("status"),
                                     tagline:  response.getString("tagline"),
                                     title: response.getString("title"),
                                     video:  response.getBool("video"),
                                     voteAverage: (response.getDouble("vote_average")),
                                     voteCount: response.getInt("voteCount"))
        
        
    }
    
    static func toEntity(dataMode: MovieDetailsDataModel) -> MovieDetails {
        return  MovieDetails(adult: dataMode.adult,
                             backdropPath: dataMode.backdropPath,
                             belongsToCollection: BelongsToCollectionDataMapper.toEntity(dataMode: dataMode.belongsToCollection),
                             budget: dataMode.budget,
                             genres: GenreDataMapperDataMapper.toListEntities(list: dataMode.genres),
                             homepage: dataMode.homepage,
                             id: dataMode.id,
                             imdbID: dataMode.imdbID,
                             originCountry: dataMode.originCountry,
                             originalLanguage: dataMode.originalLanguage,
                             originalTitle: dataMode.originalTitle,
                             overview: dataMode.overview,
                             popularity: dataMode.popularity,
                             posterPath: dataMode.posterPath,
                             productionCompanies: ProductionCompanyDataMapper.toListEntities(list: dataMode.productionCompanies),
                             productionCountries: ProductionCountryDataMapper.toListEntities(list: dataMode.productionCountries),
                             releaseDate: dataMode.releaseDate,
                             revenue: dataMode.revenue,
                             runtime: dataMode.runtime,
                             status: dataMode.status,
                             tagline: dataMode.tagline,
                             title: dataMode.title,
                             video: dataMode.video,
                             voteAverage: dataMode.voteAverage,
                             voteCount: dataMode.voteCount)
    }
    
    
}
