//
//  BelongsToCollectionDataMapper.swift
//  moviedb
//
//  Created by Ahmed samy on 20/07/2024.
//

  
import Foundation

class BelongsToCollectionDataMapper {
    static func fromApiMap(response: [String: Any]) -> BelongsToCollectionDataModel {
        return BelongsToCollectionDataModel(id: response.getInt("id"),
                                            name: response.getString("name"), posterPath: response.getString("poster_path"), backdropPath: response.getString("poster_path"));
        
    }
    
    
    
    static func toEntity(dataMode: BelongsToCollectionDataModel) -> BelongsToCollection {
        return BelongsToCollection(id: dataMode.id,
                                   name: dataMode.name,
                                   posterPath: dataMode.posterPath,
                                   backdropPath: dataMode.backdropPath)
        
    }
    
}
