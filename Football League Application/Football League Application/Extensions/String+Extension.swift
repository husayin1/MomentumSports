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
}
