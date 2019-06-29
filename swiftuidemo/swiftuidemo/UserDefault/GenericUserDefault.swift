//
//  GenericUserDefault.swift
//  swiftuidemo
//
//  Created by ismail tosun on 29.06.2019.
//  Copyright © 2019 tosun. All rights reserved.
//

import Foundation

@propertyWrapper
struct UserDefault<Value: Codable> {
    
    let key: String
    let defaultValue: Value
    
    var value: Value {
        get {
            let data = UserDefaults.standard.data(forKey: key)
            let value = data.flatMap { try? JSONDecoder().decode(Value.self, from: $0) }
            return value ?? defaultValue
        }
        set {
            let data = try? JSONEncoder().encode(newValue)
            UserDefaults.standard.set(data, forKey: key)
        }
    }
}
