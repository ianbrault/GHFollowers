//
//  Date+Ext.swift
//  GHFollowers
//
//  Created by Ian Brault on 3/19/23.
//

import Foundation

extension Date {

    func convertToMonthYearFormat() -> String {
        return formatted(.dateTime.month().year())
    }
}
