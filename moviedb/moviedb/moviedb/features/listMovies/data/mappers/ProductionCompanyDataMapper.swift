//
//  ProductionCompanyDataMapper.swift
//  moviedb
//
//  Created by Ahmed samy on 20/07/2024.
//

import Foundation


class ProductionCompanyDataMapper {
    static func fromApiMap(response: [String: Any]) -> ProductionCompanyDataModel {
        return ProductionCompanyDataModel(id: response.getInt("id"),
                                          logoPath: response.getString("logo_path"),
                                          name: response.getString("name"),
                                          originCountry: response.getString("origin_country"))
    }
    
    
    static func fromListApiMap(list: [Any]) -> [ProductionCompanyDataModel] {
        return list.compactMap { item in
            guard let itemDict = item as? [String: Any] else { return nil }
            return fromApiMap(response: itemDict)
        }
    }
    
    
    static func toEntity(dataMode: ProductionCompanyDataModel) -> ProductionCompany {
        return ProductionCompany(id: dataMode.id,
                                 logoPath: dataMode.logoPath,
                                 name: dataMode.name,
                                 originCountry: dataMode.originCountry)
    }
    
    static func toListEntities(list: [ProductionCompanyDataModel]) -> [ProductionCompany] {
        return list.compactMap { item in
            return toEntity(dataMode: item)
        }
    }
    
}
