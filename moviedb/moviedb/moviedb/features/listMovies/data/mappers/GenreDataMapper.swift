//
//  GenreDataModel.swift
//  moviedb
//
//  Created by Ahmed samy on 20/07/2024.
//

import Foundation

class GenreDataMapperDataMapper {
    static func fromApiMap(response: [String: Any]) -> GenreDataModel {
        return GenreDataModel(
            id: response.getInt("id"),
            name: response.getString("name"))
    }
    
    
    static func fromListApiMap(list: [Any]) -> [GenreDataModel] {
        return list.compactMap { item in
            guard let itemDict = item as? [String: Any] else { return nil }
            return fromApiMap(response: itemDict)
        }
    }
    
    
    static func toEntity(dataMode: GenreDataModel) -> Genre {
        return  Genre(id: dataMode.id, name: dataMode.name)
        
    }
    
    static func toListEntities(list: [GenreDataModel]) -> [Genre] {
        return list.compactMap { item in
            return toEntity(dataMode: item)
        }
    }
    
}

