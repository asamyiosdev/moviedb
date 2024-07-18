//
//  ServerConfigurationsMangager.swift
//  moviedb
//
//  Created by Ahmed samy on 17/07/2024.


import Foundation

enum ServerType: String {
    case testing = "Testing"
    case live = "Live"
}

class ServerConfigurationsManager {
    private(set) var webservicesUrl = ""
    private(set) var apiKey = ""
    
    private(set) var serverType: ServerType = .live
    
    static let sharedInstance = ServerConfigurationsManager()
    var completionHandler: (() -> Void)?
    
    init() {
        let serverTypeString = Bundle.main.infoDictionary?["ServerType"] as? String ?? "Testing"
        let serverType = ServerType(rawValue: serverTypeString) ?? .testing
        self.serverType = serverType
        var configurationsFilePath = ""
        switch serverType {
        case .testing:
            if let path = Bundle.main.path(forResource: "TestingServerConfigurations", ofType: "plist") {
                configurationsFilePath = path
            }
        case .live:
            if let path = Bundle.main.path(forResource: "LiveServerConfigurations", ofType: "plist") {
                configurationsFilePath = path
            }
        }
        
        let serverConfigurationsDictionary = NSDictionary(contentsOfFile: configurationsFilePath)
        
        if let value = serverConfigurationsDictionary?.object(forKey: "WebservicesUrl") as? String {
            webservicesUrl = value
        }
        
        if let value = serverConfigurationsDictionary?.object(forKey: "apiKey") as? String {
            apiKey = value
        }
    }
        
}
