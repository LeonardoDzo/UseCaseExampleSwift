//
//  SetUserInfoIntoStorageTests.swift
//  SetUserInfoIntoStorageTests
//
//  Created by Leonardo Durazo on 13/09/21.
//

import XCTest
@testable import UseCasesExample

class SetUserInfoIntoStorageTests: XCTestCase {
    
    var mockStorage: UserDefaults!
    var sut: SetUserInfoIntoStorageImp!
    
    override func setUp() {
        super.setUp()
        mockStorage = .init(suiteName: "UseCaseStorageTest")
        let dependencies = SetUserInfoIntoStorageImp.Dependencies(storage: mockStorage)
        sut = SetUserInfoIntoStorageImp(dependencies: dependencies)
    }
    
    override func tearDown() {
        mockStorage = nil
        sut = nil
        super.tearDown()
    }
    
    func test_execute_getUserInfoSaved() {
        let userInfo = ["theme": "system"]
        
        // when
        sut.execute(info: userInfo)
        
        // then
        guard let userInfoSaved = mockStorage.object(forKey: SetUserInfoIntoStorageImp.kUserKey) as? [String: String] else {
            XCTFail("There's should be the user saved")
            return
        }
        
        XCTAssertEqual(userInfoSaved, userInfo)
    }

}
