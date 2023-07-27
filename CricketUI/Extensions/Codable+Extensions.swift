//
//  Codable+Extensions.swift
//  CricketUI
//
//  Created by Dksh on 25/07/23.
//

import Foundation

extension Encodable {
    //MARK: -

    func toJSONData(outputFormatting: JSONEncoder.OutputFormatting = .prettyPrinted) -> Data? {
        let encoder = JSONEncoder()
        encoder.outputFormatting = outputFormatting
        return try? encoder.encode(self)
    }

}

public extension Array where Element: Encodable {
    
    func toJSON(outputFormatting: JSONEncoder.OutputFormatting = .prettyPrinted) -> [Any] {
        return self.toJSONData(outputFormatting: outputFormatting)?.toJsonObject() as? [Any] ?? []
    }
    
}
