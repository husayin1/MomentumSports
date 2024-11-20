//
//  String+Extension.swift
//  Football League Application
//
//  Created by husayn on 19/11/2024.
//

import Foundation

extension String {
    
    var asUrl: URL? {
        return URL(string: self)
    }
    
    func formattedDate(outputFormat: String = "yyyy-MM-dd HH:mm") -> String? {
        let inputFormatter = ISO8601DateFormatter()
        let outputFormatter = DateFormatter()
        
        outputFormatter.dateFormat = outputFormat
        outputFormatter.locale = Locale(identifier: "en_US_POSIX")
        outputFormatter.timeZone = TimeZone(secondsFromGMT: 0)
        if let date = inputFormatter.date(from: self) {
            return outputFormatter.string(from: date)
        }
        return nil
    }
    
    func asMatchday() -> String {
        return "Matchday \(self)"
    }
}
