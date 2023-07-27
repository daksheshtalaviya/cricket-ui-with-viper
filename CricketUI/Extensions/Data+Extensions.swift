//
//  Data+Extensions.swift
//  CricketUI
//
//  Created by Dksh on 25/07/23.
//

import Foundation

extension Data {
    
    func toJsonObject(withReadingOptions options: JSONSerialization.ReadingOptions = .mutableContainers) -> Any? {
        let dictJson = try? JSONSerialization.jsonObject(with: self, options: options)
        return dictJson
    }
}
