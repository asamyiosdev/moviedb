//
//  ProductionCountryDataMapper.swift
//  ProductionCountrydb
//
//  Created by Ahmed samy on 20/07/2024.
//

import Foundation

class ProductionCountryDataMapper {
    static func fromApiMap(response: [String: Any]) -> ProductionCountryDataModel {
        return ProductionCountryDataModel(
            iso3166_1: response.getString("iso3166_1"),
            name: response.getString("name"))
    }
    
    
    static func fromListApiMap(list: [Any]) -> [ProductionCountryDataModel] {
        return list.compactMap { item in
            guard let itemDict = item as? [String: Any] else { return nil }
            return fromApiMap(response: itemDict)
        }
    }
    
    
    static func toEntity(dataMode: ProductionCountryDataModel) -> ProductionCountry {
        return  ProductionCountry(iso3166_1: dataMode.iso3166_1, name: dataMode.name)
        
    }
    
    static func toListEntities(list: [ProductionCountryDataModel]) -> [ProductionCountry] {
        return list.compactMap { item in
            return toEntity(dataMode: item)
        }
    }
    
}

