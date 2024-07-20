import CommonCrypto
import Foundation

extension Dictionary {
    func getString(_ key: Key, defaultValue: String = String()) -> String {
        guard keys.contains(key) == true else {
            return defaultValue
        }
        if let stringValue = self[key] as? String {
            return stringValue
        } else if let value = self[key] {
            return "\(value)"
        }
        return defaultValue
    }
    
    func getBool(_ key: Key, defaultValue: Bool = Bool()) -> Bool {
        guard keys.contains(key) else {
            return defaultValue
        }
        let value = getString(key)
        if value.isEmpty == false {
            if value == "1" || value == "true" || value == "True" || value == "TRUE" {
                return true
            } else {
                return false
            }
        }
        return defaultValue
    }
    
    func getArray(_ key: Key, defaultValue: [Any] = Array()) -> [Any] {
        guard keys.contains(key) == true else {
            return defaultValue
        }
        
        if let descriptionCheck = self[key] as? [Any] {
            return descriptionCheck
        } else {
            return defaultValue
        }
    }
    
    func getTimeInterval(_ key1: Key, defaultValue: TimeInterval = TimeInterval()) -> TimeInterval {
        guard keys.contains(key1) == true else {
            return defaultValue
        }
        
        let descriptionCheck = self[key1] as? Int ?? Int(self[key1] as? String ?? "")
        if let descriptionCheckUnWrapped = descriptionCheck {
            return TimeInterval(descriptionCheckUnWrapped)
        } else {
            return defaultValue
        }
    }
    
    func getDictionary(_ key1: Key, defaultValue: Dictionary = Dictionary()) -> Dictionary {
        guard keys.contains(key1) == true else {
            return defaultValue
        }
        
        if let descriptionCheck = self[key1] as? Dictionary {
            return descriptionCheck
        } else {
            return defaultValue
        }
    }
    
    func getInt(_ key1: Key, defaultValue: Int = Int()) -> Int {
        guard keys.contains(key1) == true else {
            return defaultValue
        }
        
        let descriptionCheck = self[key1] as? Int ?? Int(self[key1] as? String ?? "")
        if descriptionCheck != nil {
            return descriptionCheck ?? 0
        } else {
            return defaultValue
        }
    }
    
    func toJSONString() -> String {
        var jsonString = ""
        
        do {
            let jsonData = try JSONSerialization.data(withJSONObject: self, options: .prettyPrinted)
            jsonString = String(data: jsonData, encoding: .utf8) ?? ""
        } catch {
            debugPrint(error.localizedDescription)
        }
        
        return jsonString
    }
    
    mutating func merge(dict: [Key: Value]) {
        for (key, value) in dict {
            self[key] = value
        }
    }
    
}
