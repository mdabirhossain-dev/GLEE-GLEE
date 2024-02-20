//
//  Date + Addition.swift
//  GLEE GLEE
//
//  Created by Md Abir Hossain on 19/2/24.
//

import Foundation

extension Date {
    func addDayToDate(day:Int)-> Date {
        guard let date = Calendar.current.date(byAdding: .day, value: day, to: Date()) else {
            return Date()
        }
        return date
    }
    func subtractDayToDate(day:Int)-> Date {
        guard let date =  Calendar.current.date(byAdding: .day, value: -day, to: Date()) else {
            return Date()
        }
        return date
    }
    
    func format(format : String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
        return dateFormatter.string(from: self)
    }
    
}
