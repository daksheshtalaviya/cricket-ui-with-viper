//
//  DateFormatter+Extensions.swift
//  CricketUI
//
//  Created by Dksh on 25/07/23.
//

import Foundation

extension DateFormatter {
    
    static let matchDetailAPI: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "M/dd/yyyy" //1/31/2019
        return formatter
    }()
    
    static let matchDetailUI: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "EEE, MMM dd, yyyy" //Tue, Jul 25, 2023
        return formatter
    }()
}
