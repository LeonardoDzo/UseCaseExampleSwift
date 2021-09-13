//
//  SetUserInfoIntoStorageUseCase.swift
//  SetUserInfoIntoStorageUseCase
//
//  Created by Leonardo Durazo on 13/09/21.
//

import Foundation

protocol SetUserInfoIntoStorageUseCase {
    func execute(info: [String: String]) -> Void
}

final class SetUserInfoIntoStorageImp {
    
    static let kUserKey = "kUserInfo"
    
    struct Dependencies {
        var storage: UserDefaults = .standard
    }
    
    let dependencies: Dependencies
    
    init(dependencies: Dependencies = .init()) {
        self.dependencies = dependencies
    }
}

extension SetUserInfoIntoStorageImp: SetUserInfoIntoStorageUseCase {
    func execute(info: [String : String]) {
        dependencies.storage.set(info, forKey: Self.kUserKey)
    }
}
