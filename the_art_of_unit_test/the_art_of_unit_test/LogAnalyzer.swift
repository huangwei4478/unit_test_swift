//
//  main.swift
//  the_art_of_unit_test
//
//  Created by huangwei on 2021/4/18.
//

import Foundation

public class LogAnalyzer {
    public func isValidLogFileName(fileName: String) -> Bool {
        return fileName.lowercased().hasSuffix(".slf")
    }
}
