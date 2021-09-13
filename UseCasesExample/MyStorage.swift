//
//  MyStorage.swift
//  MyStorage
//
//  Created by Leonardo Durazo on 13/09/21.
//

import Foundation

protocol MyStorage {
    func set<T: Encodable>(model: T, forKey: String)
    func get<T: Decodable>(key: String) -> T?
}

final class MyStorageImp: MyStorage {
    
    struct Dependencies {
        let userDefaults: UserDefaults = .standard
    }
    
    let dependencies: Dependencies
    
    init(dependencies: Dependencies = .init()) {
        self.dependencies = dependencies
    }
    
    func set<T>(model: T, forKey: String) where T : Encodable {
        guard let data = try? JSONEncoder().encode(model) else { return }
        dependencies.userDefaults.set(data, forKey: forKey)
    }
    
    func get<T>(key: String) -> T? where T : Decodable {
        guard let data = dependencies.userDefaults.object(forKey: key) as? Data else { return nil }
        return try? JSONDecoder().decode(T.self, from: data)
    }
}
