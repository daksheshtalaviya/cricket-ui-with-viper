//
//  APIExtension.swift
//  CricketUI
//
//  Created by Dksh on 25/07/23.
//

import Foundation

/// Type that acts as a generic extension point for all `APIExtended` types.
public struct APIExtension<ExtendedType> {
    /// Stores the type or metatype of any extended type.
    let type: ExtendedType

    init(_ type: ExtendedType) {
        self.type = type
    }
}

/// Protocol describing the `ax` extension points for API extended types.
public protocol APIExtended {
    /// Type being extended.
    associatedtype ExtendedType

    /// Static API extension point.
    static var ax: APIExtension<ExtendedType>.Type { get set }
    /// Instance API extension point.
    var ax: APIExtension<ExtendedType> { get set }
}

public extension APIExtended {
    /// Static API extension point.
    static var ax: APIExtension<Self>.Type {
        get { return APIExtension<Self>.self }
        set {}
    }

    /// Instance API extension point.
    var ax: APIExtension<Self> {
        get { return APIExtension(self) }
        set {}
    }
}
