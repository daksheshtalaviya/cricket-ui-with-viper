//
//  String+Extensions.swift
//  CricketUI
//
//  Created by Dksh on 25/07/23.
//

import Foundation

extension String {
    
    var trim : String {
        return self.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
    }
    
    var url : URL? {
        var urlWeb = URL(string: self.trim)
        if urlWeb == nil {
            urlWeb = URL(string: self.trim.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed) ?? "")
        }
        return urlWeb
    }
    
    var localized: String {
        return NSLocalizedString(self, comment: "")
    }
    
    func toIntValue(_ defaultValue: Int = 0) -> Int {
        Int(self) ?? defaultValue
    }
}
