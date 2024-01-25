//
//  Logger.swift
//
//
//  Created by Juan Camilo Navarro on 21/01/24.
//

import Foundation
import Resolver
import OSLog

extension LogLevel {
    var prefix: String {
        switch self {
        case .error: return "ERROR ❌ 🐛 "
        case .warning: return "WARNING ⚠️ 👻 "
        case .info: return "INFO 🍀 👾 "
        case .store: return "STORE 🤖 "
        case .storeError: return "STORE ERROR 🤖 ❌ "
        }
    }
}

extension BaseLogger {
    fileprivate static func handleLog(
        level: LogLevel,
        str: String,
        shouldLogContext: Bool,
        context: LoggerContext,
        shouldLogPusher: Bool = false
    ) {
        let logComponents = ["[\(level.prefix)]", str]
        
        var fullLog = logComponents.joined(separator: " ")
        
        if shouldLogContext {
            fullLog += " → \(context.description) "
        }
        Logger().log("\(fullLog, privacy: .public)")
    }
}

public enum BaseLogger {
    public static func info(
        _ str: String,
        _ level: LogLevel = .info,
        shouldLogContext: Bool = false,
        file: String = #file,
        function: String = #function,
        line: Int = #line
    ) {
        BaseLogger.handleLog(
            level: level,
            str: str,
            shouldLogContext: shouldLogContext,
            context: LoggerContext(file: file, function: function, line: line)
        )
    }
    
    public static func warning(
        _ str: String,
        shouldLogContext: Bool = false,
        file: String = #file,
        function: String = #function,
        line: Int = #line
    ) {
        BaseLogger.handleLog(
            level: .warning,
            str: str,
            shouldLogContext: shouldLogContext,
            context: LoggerContext(file: file, function: function, line: line)
        )
    }
    
    public static func error(
        _ str: String,
        _ level: LogLevel = .error,
        shouldLogContext: Bool = false,
        file: String = #file,
        function: String = #function,
        line: Int = #line
    ) {
        BaseLogger.handleLog(
            level: level,
            str: str,
            shouldLogContext: shouldLogContext,
            context: LoggerContext(file: file, function: function, line: line)
        )
    }
}
