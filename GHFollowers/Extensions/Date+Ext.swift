//
//  Date+Ext.swift
//  GHFollowers
//
//  Created by Ian Brault on 3/19/23.
//

import Foundation

extension Date {

    func convertToMonthYearFormat() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMM yyyy"

        return dateFormatter.string(from: self)
    }
}
