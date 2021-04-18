//
//  LogAnalyzerTests.swift
//  UnitTest
//
//  Created by huangwei on 2021/4/18.
//

import XCTest

// Arrange - Act - Assert

@testable import the_art_of_unit_test

class LogAnalyzerTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testIsValidFileName_BadExtension_ReturnsFalse() {
        let analyzer = LogAnalyzer()
        
        let result = analyzer.isValidLogFileName(fileName: "fileWithBadExtension.foo")
        
        XCTAssertFalse(result)
    }
    
    func testIsValidLogFileName_GoodExtensionLowercase_ReturnsTrue() {
        let analayzer = LogAnalyzer()
        let result = analayzer.isValidLogFileName(fileName: "filewithgoodextension.slf")
        XCTAssertTrue(result)
    }
    
    func testIsValidLogFileName_GoodExtensionUpperCase_ReturnsTrue() {
        let analyzer = LogAnalyzer()
        let result = analyzer.isValidLogFileName(fileName: "filewithgoodextension.SLF")
        XCTAssertTrue(result)
    }
    
    func testIsValidFileName_NameSupportedExtension_ReturnsTrue() {
        let myFakeManager = FakeExtensionManager(willBeValid: true)
        
        let log = LogAnalyzer(manager: myFakeManager)
        
        let result = log.isValidLogFileName(fileName: "short.ext")
        
        XCTAssertTrue(result)
    }
    
    // This is a stub
    final class FakeExtensionManager: IExtensionManager {
        func isValid(fileName: String) -> Bool {
            return willBeValid
        }
        
        let willBeValid: Bool
        
        init(willBeValid: Bool) {
            self.willBeValid = willBeValid
        }
    }
    
}
