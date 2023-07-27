//
//  Optional+Extensions.swift
//  CricketUI
//
//  Created by Dksh on 25/07/23.
//

import Foundation

extension Optional where Wrapped == String {
    //MARK: -

    var valueOrEmpty: String {
        guard let unwrapped = self else { return "" }
        return unwrapped
    }
}

extension Optional where Wrapped == Bool {
    //MARK: -

    var valueOrEmpty: Bool {
        guard let unwrapped = self else { return false }
        return unwrapped
    }
}

extension Optional where Wrapped == Int {
    //MARK: -

    var valueOrEmpty: Int {
        guard let unwrapped = self else { return 0 }
        return unwrapped
    }
}

extension Optional where Wrapped == Double {
    //MARK: -

    var valueOrEmpty: Double {
        guard let unwrapped = self else { return 0 }
        return unwrapped
    }
}

extension Optional where Wrapped == Date {
    //MARK: -

    var valueOrEmpty: Date {
        guard let unwrapped = self else { return Date() }
        return unwrapped
    }
}

extension Optional where Wrapped: ExpressibleByArrayLiteral {
    var valueOrEmpty: Wrapped {
        guard let unwrapped = self else { return [] }
        return unwrapped
    }
}
