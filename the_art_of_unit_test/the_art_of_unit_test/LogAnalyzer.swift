//
//  main.swift
//  the_art_of_unit_test
//
//  Created by huangwei on 2021/4/18.
//

import Foundation

public final class LogAnalyzer {
    
    private let manager: IExtensionManager
    
    public init(manager: IExtensionManager = FileExtensionManager()) {
        self.manager = manager
    }
    
    public func isValidLogFileName(fileName: String) -> Bool {
        return manager.isValid(fileName: fileName)
    }
}

public protocol IExtensionManager {
    func isValid(fileName: String) -> Bool
}

// 欲练 TDD 神功，必先 重构
public final class FileExtensionManager: IExtensionManager {
    public init() {}
    
    public func isValid(fileName: String) -> Bool {
        // read the file, then tell the truth
        return fileName.lowercased().hasSuffix(".slf")
    }
}

public final class AlwaysValidFakeExtensionManager: IExtensionManager {
    public func isValid(fileName: String) -> Bool {
        return true
    }
}
